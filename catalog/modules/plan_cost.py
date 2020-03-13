# ALGORITHMS = {  https://qna.habr.com/q/547870
#     'porotherm_44': porotherm_44,
#     'solid_ceramic_brick': solid_ceramic_brick,
# }

# def apply_algorithm(algorithm):
#     ALGORITHMS[algorithm]()

def plan_cost(scheme, params, settings):

    # settings = { задают из каких материалов какие стены считать. Могут сожержать 
    #     'bearing_living_outdoor' = {
            # 'algorithm': algorithm,
    #         'mat_unit_name': есдиница материала, например, rock_wall_material_unite,
    #         'price': price
    #     }       
    #     'bearing_uninhabited_outdoor' = {
            # 'algorithm': algorithm,
    #         'mat_unit_name': есдиница материала, например, rock_wall_material_unite,
    #         'price': price
    #     }
    #     .....
    # }

    if settings['bearing_living_outdoor']['algorithm'] == 'solid_ceramic_brick':
        