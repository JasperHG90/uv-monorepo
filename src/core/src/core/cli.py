import typer

from core import return_two

app = typer.Typer()


@app.command()
def run():
    print(f"Here is {return_two()} for you")


def entrypoint():
    app()
