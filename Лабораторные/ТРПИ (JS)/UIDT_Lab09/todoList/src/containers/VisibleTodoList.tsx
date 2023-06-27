import { connect } from 'react-redux';
import { toggleTodoAC } from '../actions';
import TodoList from '../components/TodoList';
import { VisibilityFilters } from '../actions';
import { Todo } from '../types/todoTypes';
import {visibilityFilter} from '../types/actionTypes'

const getVisibleTodos = (todos:Todo[], filter:visibilityFilter):Todo[] => {
  switch (filter) {
    case VisibilityFilters.SHOW_ALL:
      return todos;
    case VisibilityFilters.SHOW_COMPLETED:
      return todos.filter((t) => t.completed);
    case VisibilityFilters.SHOW_ACTIVE:
      return todos.filter((t) => !t.completed);
    default:
      throw new Error('Unknown filter: ' + filter);
  }
};

const mapStateToProps = (state:Todo[]|visibilityFilter) => ({
  todos: getVisibleTodos(
    state.todos,
    state.visibilityFilter
  ),
});
const mapDispatchToProps = (dispatch) => ({
  toggleTodoAC: (id:number) => dispatch(toggleTodoAC(id)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
