import { connect } from 'react-redux';
import { setVisibilityFilter } from '../actions';
import Link from '../components/Link';

const mapStateToProps = (state, ownProps) => ({
  active: ownProps.filter === state.visibilityFilter,
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  onClick: () =>
    dispatch(setVisibilityFilter(ownProps.filter)),
});

export default connect(
  mapStateToProps,//returns object with property active: boolean
  mapDispatchToProps//returns object with property onClick() that invokes dispatch
)(Link);//attaches active and onClick properties to Link