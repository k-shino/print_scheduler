import plotly.figure_factory as ff
from ast import literal_eval

with open('config.json', "r") as h:
    conffile = h.read()
    config = literal_eval(conffile)

with open('tasks.json', "r") as f:
    tasks = f.read()
    df = literal_eval(tasks)

with open('env-definition.json', "r") as g:
    env = g.read()
    colors = literal_eval(env)

fig = ff.create_gantt(df, colors=colors, index_col='Resource', title=config.get('title'),
                      show_colorbar=True, bar_width=config.get('bar_width'), showgrid_x=True, 
                      showgrid_y=True, group_tasks=True, height=config.get('height'), width=config.get('width'))
fig.write_image(config.get('filename'))
