import { connect } from 'react-redux';
import Link from '../components/Link';
import { setVisibilityFilterAC } from '../actions';
import { Todo as TodoType} from '../types/todoTypes';
import {Dispatch, visibilityFilter} from '../types/actionTypes'

const mapStateToProps = (state:TodoType[], ownProps:visibilityFilter) => ({
  active: ownProps.filter === state.visibilityFilter,
});

const mapDispatchToProps = (dispatch: Dispatch, ownProps:TodoType[]|visibilityFilter) => ({
  onClick: () =>
    dispatch(setVisibilityFilterAC(ownProps.filter)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Link);
