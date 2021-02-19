extends Node

var _fba = null

# Firebase Analytics constants:
# Event names: add_payment_info, add_to_cart, add_to_wishlist, app_open, begin_checkout, campaign_details, checkout_progress, earn_virtual_currency, ecommerce_purchase, generate_lead, join_group, level_up, login, post_score, present_offer, purchase_refund, remove_from_cart, search, select_content, set_checkout_option, share, sign_up, spend_virtual_currency, tutorial_begin, tutorial_complete, unlock_achievement, view_item, view_item_list, view_search_results, level_start, level_end
# Parameter names: character (str), checkout_step (int), checkout_option (str), content_type (str), coupon (str), cp1 (str), creative_name (str), creative_slot (str), currency (str USD|EUR|...), destination (str), end_date (str YYYY-MM-DD), flight_number (str), group_id (str), index (int), item_brand (str), item_category (str), item_id (str), item_location_id (str), item_name (str), item_list (str), item_variant (str), level (int), location (str), medium (str), number_of_nights (int), number_of_passengers (int), number_of_rooms (int), origin (str), price (double), quantity (int), score (int), search_term (str), shipping (double), sign_up_method (str), source (str), start_date (str YYYY-MM-DD), tax (double), term (str), transaction_id (str), travel_class (str), value (int|double), virtual_currency_name (str), level_name (str), success (0|1), 
# User property names: sign_up_method (str)

func _ready():
    if(Engine.has_singleton("FirebaseAnalytics")):
        _fba = Engine.get_singleton("FirebaseAnalytics")
        print('FirebaseAnalytics plugin inited!')
    elif type_exists('FirebaseAnalytics'):
        _fba = ClassDB.instance('FirebaseAnalytics')
        print('FirebaseAnalytics plugin inited!')

func screen(name, screen_class='Godot'):
    # log game screen
    if _fba != null:
        _fba.logEvent('screen', {'name': name, 'class': screen_class})

func setUserId(id: String) -> void:
    if _fba != null:
        _fba.setUserId(id)

func logEvent(event, params = {}):
    if _fba != null:
        if params == null:
            params = {}
        _fba.logEvent(event, params)

func userProperties(props):
    # set user properties
    if _fba != null:
        for prop in props:
            _fba.setUserProperty(prop, var2str(props[prop]))

func start_checkout(item_id, item_name, item_category, price=0, currency='USD'):
    if _fba != null:
        _fba.logEvent('add_to_cart', {'item_id': item_id, 'name': item_name, 'item_category': item_category, 'quantity': 1})
        _fba.logEvent('begin_checkout', {'value': price, 'currency': currency})

func revenue(price, quantity, product, currency='USD', signature='', receipt=''):
    if _fba != null:
        _fba.logEvent('ecommerce_purchase', {'value': price, 'currency': currency})
