import HeaderComponent from "../components/HeaderComponent";
import {connect} from "react-redux";
import {Dispatch, State, toggleVisibility, VisibilityFilters} from "../actions";

const mapStateToProps = (state: State) => ({
    showFavourites: state.visibilityFilter !== VisibilityFilters.SHOW_ALL,
});

const mapDispatchToProps = (dispatch: Dispatch) => ({
    handleButtonClick: (showFavourites) => dispatch(toggleVisibility(showFavourites)),
});

export default connect(mapStateToProps, mapDispatchToProps)(HeaderComponent)