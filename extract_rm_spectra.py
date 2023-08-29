from astropy.wcs import WCS
from astropy.io import fits
from astropy.coordinates import SkyCoord
from pathlib import Path
import pickle as pkl
import numpy as np
import yaml


def read_fits_cube(source_coords, fits_cube):
    """Read fits cubes of rts images.

    Cubes with the weird axis order. The first
    axis is phi, followed by ra, dec.
    When the fits file is read by astropy,
    the indexing order is reversed

    data == [δ, ⍺, ɸ]

    Parameters
    ----------
    source_coords : skycoord object
        SkyCoord object of sim source
    fits_cube: str
        Path to fits cube
    """

    fits_cube = Path(fits_cube)
    print(fits_cube)
    print(fits_cube.is_file())

    # Open cube and grab header and data
    with fits.open(fits_cube) as hdus:
        hdu = hdus[0]
        hdr = hdu.header
        data_cube = hdu.data

    # World Coordinate System
    wcs = WCS(hdr)

    # Determine range of freqs, ra, dec in data
    # Here, the order of indexing the same as the fits file
    # wcs.all_pix2world(ɸ, ⍺, δ, 0)
    # The last 0 ensures pythonic zero indexing
    phis, _, _ = wcs.all_pix2world(np.arange(data_cube.shape[2]), 0, 0, 0)
    _, ras, _ = wcs.all_pix2world(0, np.arange(data_cube.shape[1]), 0, 0)
    _, _, decs = wcs.all_pix2world(0, 0, np.arange(data_cube.shape[0]), 0)

    # Determine pixel coordinates of pogs object
    _, ra_x, dec_y = wcs.all_world2pix(
        0, source_coords.ra.deg, source_coords.dec.deg, 0
    )

    # Convert to closes integer pixel index
    ra_x = np.round(ra_x).astype(int)
    dec_y = np.round(dec_y).astype(int)

    # Extract spectral slice of cube at location of pogs source
    rm_spec = data_cube[dec_y, ra_x, :]

    # Extract 3x3xn array centered on source
    arr = [
        data_cube[dec_y, ra_x, :],
        data_cube[dec_y + 1, ra_x, :],
        data_cube[dec_y + 1, ra_x + 1, :],
        data_cube[dec_y + 1, ra_x - 1, :],
        data_cube[dec_y, ra_x + 1, :],
        data_cube[dec_y, ra_x - 1, :],
        data_cube[dec_y - 1, ra_x, :],
        data_cube[dec_y - 1, ra_x + 1, :],
        data_cube[dec_y - 1, ra_x - 1, :],
    ]

    rm_med = np.median(arr, axis=0)
    rm_avg = np.mean(arr, axis=0)
    rm_max = np.amax(arr, axis=0)

    rm_spec = {'phi': phis, 'rm_med': rm_med,
               'rm_avg': rm_avg, 'rm_max': rm_max}

    with open(f'{fits_cube.stem}.pkl', 'wb') as f:
        pkl.dump(rm_spec, f)


if __name__ == "__main__":

    with open('/astro/mwaeor/achokshi/hyperdrive/data/old/srclists/srclist_cfg.yaml', 'r') as stream:
        cat = yaml.safe_load(stream)
        # RM_10N = SkyCoord(
        #     cat['point_center']['ra']+cat['sources']['RM_10N']['del_ra'],
        #     cat['point_center']['dec']+cat['sources']['RM_10N']['del_dec'],
        #     unit="deg")

        for s in cat['sources'].keys():
            if 'RM' in s:
                rm_coord = SkyCoord(
                    cat['point_center']['ra']+cat['sources'][s]['del_ra'],
                    cat['point_center']['dec']+cat['sources'][s]['del_dec'],
                    unit="deg")
                print(f"SIM_{s}_DEF")
                read_fits_cube(rm_coord, f'/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/cubes/SIM_{s}_DEF/SIM_{s}_DEF_p.phi.dirty.fits')
                read_fits_cube(rm_coord, f'/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/cubes/SIM_{s}_DEF_CAL_DEF/SIM_{s}_DEF_CAL_DEF_p.phi.dirty.fits')
                read_fits_cube(rm_coord, f'/astro/mwaeor/achokshi/hyperdrive/data/fake_sky/cubes/SIM_{s}_DEF_CAL_FEE/SIM_{s}_DEF_CAL_FEE_p.phi.dirty.fits')
