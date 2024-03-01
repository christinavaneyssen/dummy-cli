import click


@click.command(
    name="dummy",
    context_settings={"allow_interspersed_args": True, "ignore_unknown_options": True},
)
def cli():
    """My first click command"""
    click.echo("Hello world")
