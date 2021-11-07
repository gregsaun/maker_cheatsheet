#Author-Grégoire Saunier
#Description-Creates basic parameters for 3D printing Bear projects

import adsk.core, adsk.fusion, traceback

# List of the parameters you would like to add
# Format: ['name', 'value', 'unit', 'comment'],
paramsToAdd = [
    ['layer_height',          '0.2',                                   'mm', ''],
    ['e_width',               '0.45',                                  'mm', 'extrusion_width'],
    ['e_spacing',             'e_width - layer_height * (1 - PI / 4)', 'mm', 'extrusion spacing according to PrusaSlicer default settings'],
    ['num_perims',            '4',                                     '',   'number of perimeters'],
    ['num_tops_bottoms',      '5',                                     '',   'number of top and bottom layers'],
    ['m3_hole',               '3.3',                                   'mm', 'M3 hole diameter'],
    ['m3_head',               '5.8',                                   'mm', 'M3 screw ISO4762 head diameter'],
    ['m3_thread',             '2.7',                                   'mm', 'M3 self threading hole diameter'],
    ['m3_hex_nut',            '6.2',                                   'mm', 'M3 hex nut ISO4032 inscribed diameter'],
    ['m3_square_nut',         '5.5',                                   'mm', 'M3 square nut DIN562 pocket width'],
    ['m5_hole',               '5.3',                                   'mm', 'M5 hole diameter'],
    ['m5_head',               '10',                                    'mm', 'M5 screw ISO4762 head diameter'],
    ['perims_width',          'floor(( e_width + ( num_perims - 1 ) * e_spacing ) * 100) / 100', 'mm', 'width of num_perims perimeters'],
    ['double_perims_width',   'floor(( e_width + ( num_perims * 2 - 1 ) * e_spacing ) * 100) / 100', 'mm', 'width of double number of num_perims perimeters'],
]

def run(context):
    ui = None
    try:
        app = adsk.core.Application.get()
        ui  = app.userInterface

        # Get the active design
        design = adsk.fusion.Design.cast(app.activeProduct)
        if not design:
            ui.messageBox('No active Fusion design')
            return

        # Maintain a list of parameters which couldn't be added
        skippedParameters = []

        # Parse parameters one by one and add them to the active design
        userParameters = design.userParameters
        for parameter in paramsToAdd:
            print(parameter[0])

            # Only add the parameter if it's new
            existingParameter = userParameters.itemByName(parameter[0])
            if existingParameter is None:
                userParameters.add(parameter[0], adsk.core.ValueInput.createByString(parameter[1]), parameter[2], parameter[3])
            else:
                skippedParameters.append(parameter[0])

        # Display a message showing any parameters that pre-existed
        if len(skippedParameters):
            ui.messageBox('Parameters have been created successfully except {} which have been skipped as they existed already.'.format(skippedParameters))
        else:
            ui.messageBox('Parameters have been created successfully')

    except:
        if ui:
            ui.messageBox('Failed:\n{}'.format(traceback.format_exc()))
