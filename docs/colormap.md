# Colormaps

## Dependencies

```python
# mkdocs: render

def plot_color_gradients(category, cmap_list):
    import numpy as np
    import matplotlib.pyplot as plt

    # define griadent
    gradient = np.linspace(0, 1, 256)
    gradient = np.vstack((gradient, gradient))

    # Create figure and adjust figure height to number of colormaps
    nrows = len(cmap_list)
    figh = 0.35 + 0.15 + (nrows + (nrows - 1) * 0.1) * 0.22
    fig, axs = plt.subplots(nrows=nrows + 1, figsize=(6.4, figh))
    fig.subplots_adjust(top=1 - 0.35 / figh, bottom=0.15 / figh,
                        left=0.2, right=0.99)
    axs[0].set_title(f'{category}', fontsize=14)

    for ax, name in zip(axs, cmap_list):
        ax.imshow(gradient, aspect='auto', cmap=plt.get_cmap(name))
        ax.text(-0.01, 0.5, name, va='center', ha='right', fontsize=10,
                transform=ax.transAxes)

    # Turn off *all* ticks & spines, not just the ones with colormaps.
    for ax in axs:
        ax.set_axis_off()
```

## Colormaps

```python
# mkdocs: render
import statworx_theme
```

### Discrete Maps

=== "Discrete"

    ```python
    # mkdocs: render

    plot_color_gradients('Discrete Statworx Themes',
                         ['stwx:standard', 'stwx:alternative', 'stwx:deep'])
    ```

=== "Qualitative"

    ```python
    # mkdocs: render
    plot_color_gradients('Qualitative Statworx Themes',
                         ['stwx:good2bad', 'stwx:bad2good'])
    ```

### Continous Maps

=== "Fading"

    ```python
    # mkdocs: render
    plot_color_gradients(
        "Fading Statworx Themes", [f"stwx:{c}_fade" for c in ["Bl", "Rd", "Gn", "Yw"]]
    )
    ```

=== "Blending"

    ```python
    # mkdocs: render
    from itertools import product

    color_names = ["Bl", "Rd", "Gn", "Yw"]
    plot_color_gradients(
        "Blending Statworx Themes",
        [f"stwx:{c1}{c2}_blend" for (c1, c2) in product(color_names, color_names) if c1 != c2],
    )
    ```

=== "Diverging"

    ```python
    # mkdocs: render
    from itertools import product

    color_names = ["Bl", "Rd", "Gn", "Yw"]
    plot_color_gradients(
        "Diverging Statworx Themes",
        [f"stwx:{c1}{c2}_diverging" for (c1, c2) in product(color_names, color_names)],
    )
    ```

=== "Rising"

    ```python
    # mkdocs: render
    from itertools import product

    color_names = ["Bl", "Rd", "Gn", "Yw"]
    plot_color_gradients(
        "Rising Statworx Themes",
        [f"stwx:{c}_rise" for c in color_names],
    )
    ```

## Usage

=== "stwx:good2bad"

    ```python
    # mkdocs: render

    import seaborn as sns
    import matplotlib.pyplot as plt

    # Load the example flights dataset and convert to long-form
    flights_long = sns.load_dataset("flights")
    flights = flights_long.pivot("month", "year", "passengers")

    # Draw a heatmap with the numeric values in each cell
    f, ax = plt.subplots(figsize=(9, 6))
    sns.heatmap(flights, annot=True, fmt="d", linewidths=.5, ax=ax, cmap="stwx:good2bad")
    ```

=== "stwx:Bl_fade"

    ```python
    # mkdocs: render

    import seaborn as sns
    import matplotlib.pyplot as plt

    # Load the example flights dataset and convert to long-form
    flights_long = sns.load_dataset("flights")
    flights = flights_long.pivot("month", "year", "passengers")

    # Draw a heatmap with the numeric values in each cell
    f, ax = plt.subplots(figsize=(9, 6))
    sns.heatmap(flights, annot=True, fmt="d", linewidths=.5, ax=ax, cmap="stwx:Bl_fade")
    ```

=== "stwx:Rd_rise"

    ```python
    # mkdocs: render

    import seaborn as sns
    import matplotlib.pyplot as plt

    # Load the example flights dataset and convert to long-form
    flights_long = sns.load_dataset("flights")
    flights = flights_long.pivot("month", "year", "passengers")

    # Draw a heatmap with the numeric values in each cell
    f, ax = plt.subplots(figsize=(9, 6))
    sns.heatmap(flights, annot=True, fmt="d", linewidths=.5, ax=ax, cmap="stwx:Rd_rise")
    ```
