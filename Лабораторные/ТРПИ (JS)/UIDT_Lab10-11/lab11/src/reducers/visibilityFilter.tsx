import {Actions, VisibilityFilters} from '../actions';
import {jobsState} from "../index";

type SetVisibilityFilterAction = {
    type: Actions,
    payload: VisibilityFilters
}
type VisibilityFilterReducer = (state: VisibilityFilters, action: SetVisibilityFilterAction) => VisibilityFilters

const visibilityFilter: VisibilityFilterReducer = (state = VisibilityFilters.SHOW_ALL, action) => {
    switch (action.type) {
        case Actions.SET_VISIBILITY_FILTER:
        {
            return action.payload
        }
        default:
            return state;
    }
};

export default visibilityFilter;