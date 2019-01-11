import click


# Main Entry ----------------------------
@click.group(invoke_without_command=True)
@click.pass_context
def backlight(context):
    '''Modifies Intel-based screen backlight brightness. '''
    if context.invoked_subcommand is None:
        get()

# Sub Commands ===========================

# Get ------------------------------------
@backlight.command()
@click.option('--value', is_flag=True, default=False, help='Set this flag to output the internal brightness value instead of a percentage of its max.')
def get(value):
    ''' Output the current brightness level.'''
    cur_brightness = _get()

    if value:
        output = cur_brightness
    else:
        max_brightness = _max()
        output = cur_brightness / max_brightness

    click.echo(output)


# Increase --------------------------------
@backlight.command()
@click.argument('amount', type=click.FLOAT, default=.1)
def increase(amount):
    '''Modify by an amount greater than 0 and less than 1.0 '''
    max_brightness = _max()
    cur_brightness = _get()

    # Calculate new val based on amount input.
    new_value = int(min( max_brightness, cur_brightness + max_brightness * amount ))
    click.echo('Backlight set to %d of a max of %d' % (new_value, max_brightness))
    _set(new_value)


# Decrease ---------------------------------
@backlight.command()
@click.argument('amount', type=click.FLOAT, default=.1)
def decrease(amount):
    '''Modify by an amount greater than 0 and less than 1.0 '''
    max_brightness = _max()
    cur_brightness = _get()

    # Calculate new val based on amount input.
    new_value = int(max( 0, cur_brightness - max_brightness * amount ))
    click.echo('Backlight set to %d of a max of %d' % (new_value, max_brightness))

    _set(new_value)


# Set ---------------------------------------
@backlight.command()
@click.argument('value', type=click.FLOAT, default=.1)
def set(value):
    '''Set to a percentage value greater than 0 and less than 1.0 where 0 is off and 1.0 is 100% '''
    max_brightness = _max()

    # Calculate new val based on amount input.
    new_value = int( min(max( value*max_brightness, 0), max_brightness ))
    click.echo('Backlight set to %d of a max of %d' % (new_value, max_brightness))

    _set(new_value)


# Private Methods =============================
def _get():
    f = open("/sys/class/backlight/intel_backlight/brightness", "r")
    cur_brightness = int(f.readline())
    f.close()
    return cur_brightness


def _set(new_value):
    f = open("/sys/class/backlight/intel_backlight/brightness", "w")
    f.write(str(new_value))
    f.close()


def _max():
    f = open("/sys/class/backlight/intel_backlight/max_brightness", "r")
    max_brightness = int(f.readline())
    f.close()
    return max_brightness


