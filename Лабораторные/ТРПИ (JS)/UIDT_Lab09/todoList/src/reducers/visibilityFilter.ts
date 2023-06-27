import { VisibilityFilters } from '../actions';
import {Action} from '../types/actionTypes'

const visibilityFilter = (
  state:string = VisibilityFilters.SHOW_ALL,
  action:Action
) => {
  switch (action.type) {
    case 'SET_VISIBILITY_FILTER':
      return action.filter;
    default:
      return state;
  }
};

export default visibilityFilter;
