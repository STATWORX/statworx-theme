# Gallery

The gallery should help you to see the themes and colors applied in different plots. This template can also serve as an inspiration to get an idea of which graphics might be suitable for your case. Note that this template should not be considered as a 1 to 1 guideline but rather as a tool which helps statworx to create a more coherent picture when visualizing data.

## Apply Style

To apply the statworx theme to a matplotlib plot, simply run the `apply_style` functions as shown below.
All subsequently generated plots will have the statworx colors.

```python
# mkdocs: render
from statworx_theme import apply_style
apply_style()
```

## Distribution

=== "Density Chart"

    ```python
    # mkdocs: render
    import seaborn as sns
    tips = sns.load_dataset("tips")
    sns.kdeplot(data=tips, x="total_bill", hue="time", fill=True, common_norm=False)
    ```

=== "Stacked Distribution Chart"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the diamonds dataset
    diamonds = sns.load_dataset("diamonds")

    # Plot the distribution of clarity ratings, conditional on carat
    sns.displot(
        data=diamonds,
        x="carat",
        hue="cut",
        kind="kde",
        multiple="fill",
        clip=(0, None),
        palette="stwx:Bl_fade",
    )
    ```

=== "Violin Plot"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the example tips dataset
    tips = sns.load_dataset("tips")

    # Draw a nested violinplot and split the violins for easier comparison
    sns.violinplot(
        data=tips,
        x="day",
        y="total_bill",
        hue="smoker",
        split=True,
        inner="quart",
    )
    sns.despine(left=True)
    ```

=== "Histogram"

    !!! hint
        When making a histogram, always explore multiple bin widths. In addition, avoid overlapping histograms as they can be confused with stacked bar charts.

    ```python
    # mkdocs: render
    import seaborn as sns

    diamonds = sns.load_dataset("diamonds")

    sns.histplot(
        diamonds,
        x="price", hue="cut",
        multiple="stack",
        log_scale=True,
    )
    ```

## Timeseries

=== "Line Plot"

    ```python
    # mkdocs: render
    import numpy as np
    import pandas as pd
    import seaborn as sns

    rs = np.random.RandomState(365)
    values = rs.randn(365, 4).cumsum(axis=0)
    dates = pd.date_range("1 1 2016", periods=365, freq="D")
    data = pd.DataFrame(values, dates, columns=["A", "B", "C", "D"])
    data = data.rolling(7).mean()

    sns.lineplot(data=data, linewidth=2.5)
    ```

=== "Interval Line Plot"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load an example dataset with long-form data
    fmri = sns.load_dataset("fmri")

    # Plot the responses for different events and regions
    sns.lineplot(x="timepoint", y="signal",
                 hue="region", style="event",
                 data=fmri)
    ```

=== "Stacked Line Plot"

    ```python
    # mkdocs: render
    import matplotlib.pyplot as plt
    import matplotx
    import numpy as np

    # create data

    rng = np.random.default_rng(0)
    offsets = [1.0, 1.50, 1.60]
    labels = ["no balancing", "CRV-27", "CRV-27*"]
    x0 = np.linspace(0.0, 3.0, 100)
    y = [offset * x0 / (x0 + 1) + 0.1 * rng.random(len(x0)) for offset in offsets]

    # plot
    for yy, label in zip(y, labels):
        plt.plot(x0, yy, label=label)
    plt.xlabel("distance [m]")
    matplotx.ylabel_top("voltage [V]")  # move ylabel to the top, rotate
    matplotx.line_labels()  # line labels to the right
    plt.show()
    ```

## Relationship

=== "Regression Plot"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the penguins dataset
    penguins = sns.load_dataset("penguins")

    # Plot sepal width as a function of sepal_length across days
    g = sns.lmplot(
        data=penguins, x="bill_length_mm", y="bill_depth_mm", hue="species", height=5
    )

    # Use more informative axis labels than are provided by default
    g.set_axis_labels("Snoot length (mm)", "Snoot depth (mm)")
    plt.title("Lorem Ipsum Dolor Sit Amet")
    ```

=== "Bubble Chart"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the example mpg dataset
    mpg = sns.load_dataset("mpg")

    # Plot miles per gallon against horsepower with other semantics
    sns.relplot(x="horsepower", y="mpg", hue="origin", size="weight",
                sizes=(40, 400), alpha=.5, palette="stwx:alternative",
                height=6, data=mpg)
    ```

=== "Joint Density"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the penguins dataset
    penguins = sns.load_dataset("penguins")

    # Show the joint distribution using kernel density estimation
    g = sns.jointplot(
        data=penguins,
        x="bill_length_mm", y="bill_depth_mm", hue="species",
        kind="kde",
    )
    ```

=== "Scatter Plot"

    ```python
    # mkdocs: render
    import seaborn as sns
    mpg = sns.load_dataset("mpg")

    # Use JointGrid directly to draw a custom plot
    g = sns.JointGrid(data=mpg, x="mpg", y="acceleration", space=0, ratio=17)
    g.plot_joint(sns.scatterplot, legend=False)
    g.plot_marginals(sns.rugplot, height=1)
    ```

=== "Pair Plot"

    ```python
    # mkdocs: render

    import seaborn as sns

    df = sns.load_dataset("penguins")
    sns.pairplot(df, hue="species")
    ```

=== "Correlation Plot"

    ```python
    # mkdocs: render

    from string import ascii_letters
    import numpy as np
    import pandas as pd
    import seaborn as sns
    import matplotlib.pyplot as plt

    # Generate a large random dataset
    rs = np.random.RandomState(33)
    d = pd.DataFrame(data=rs.normal(size=(100, 10)),
                     columns=list(ascii_letters[26:26+10]))

    # Compute the correlation matrix
    corr = d.corr()

    # Generate a mask for the upper triangle
    mask = np.triu(np.ones_like(corr, dtype=bool))

    # Draw the heatmap with the mask and correct aspect ratio
    sns.heatmap(corr, mask=mask, cmap="stwx:Bl_fade", vmax=.3, center=0,
                square=True, linewidths=.5, cbar_kws={"shrink": .5})
    ```

## Comparison

=== "Bar Plot"

    !!! hint
        One should only rearrange bars, when there is no natural ordering to the categories. Whenever there is a natural ordering (i.e. when our categorical variable is an ordered factor) one should keep the original ordering in the visualization.
        When bars are of similar length it is visually less appealing to use bar plots (“Moire effect”). In this case, one can resort to use Lollipop charts.

    ```python
    # mkdocs: render

    import seaborn as sns

    penguins = sns.load_dataset("penguins")

    # Draw a nested barplot by species and sex
    g = sns.catplot(
        data=penguins, kind="bar",
        x="species", y="body_mass_g", hue="sex",
        ci=None
    )
    g.despine(left=True)
    g.set_axis_labels("", "Body mass (g)")
    g.legend.set_title("")
    ```

=== "Stacked Bar Plot"

    ```python
    # mkdocs: render

    import seaborn as sns
    import matplotlib.pyplot as plt
    from statworx_theme.colors import BLUE, LIGHT_BLUE

    # Initialize the matplotlib figure
    f, ax = plt.subplots(figsize=(6, 15))

    # Load the example car crash dataset
    crashes = sns.load_dataset("car_crashes").sort_values("total", ascending=False)

    # Plot the total crashes
    sns.set_color_codes("pastel")
    sns.barplot(x="total", y="abbrev", data=crashes,
                label="Total", color=LIGHT_BLUE)

    # Plot the crashes where alcohol was involved
    sns.set_color_codes("muted")
    sns.barplot(x="alcohol", y="abbrev", data=crashes,
                label="Alcohol-involved", color=BLUE)

    # Add a legend and informative axis label
    ax.legend(ncol=2, loc="lower right", frameon=True)
    ax.set(xlim=(0, 24), ylabel="",
           xlabel="Automobile collisions per billion miles")
    sns.despine(left=True, bottom=True)
    ```

=== "Boxplot"

    !!! hint
         Adding jittered points to a box plot is useful to see the underlying distribution of the data.

    ```python
    # mkdocs: render

    import seaborn as sns

    # Load the example tips dataset
    tips = sns.load_dataset("tips")

    # Draw a nested boxplot to show bills by day and time
    sns.boxplot(x="day", y="total_bill",
                hue="smoker",
                data=tips)
    sns.despine(offset=10, trim=True)
    ```

=== "Boxen Plot"

    ```python
    # mkdocs: render
    import seaborn as sns

    diamonds = sns.load_dataset("diamonds")
    clarity_ranking = ["I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"]

    sns.boxenplot(x="clarity", y="carat",
                  color=BLUE, order=clarity_ranking,
                  scale="linear", data=diamonds)
    ```

=== "Swarm Plot"

    ```python
    # mkdocs: render
    import seaborn as sns

    # Load the penguins dataset
    df = sns.load_dataset("penguins")

    # Draw a categorical scatterplot to show each observation
    ax = sns.swarmplot(data=df, x="body_mass_g", y="sex", hue="species")
    ax.set(ylabel="")
    ```
