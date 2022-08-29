"""statworx_theme module
"""

from .colormaps import *
from .utils import (  # unimport:skip
    apply_custom_colors,
    apply_style,
    register_blended_cmap,
    register_listed_cmap,
    get_stwx_cmaps,
    apply_style_altair,
    apply_custom_colors_altair,
    apply_style_plotly,
    apply_custom_colors_plotly,
)

__version__ = "0.10.0"
