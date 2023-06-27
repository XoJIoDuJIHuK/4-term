import {connect} from "react-redux";
import {SearchBarComponent} from "../components/SearchBarComponent";
import {Dispatch, Filter} from "../actions";

const mapStateToProps = (state: Filter) => {
    return {
        stateOfFilter: state.stateOfJobsList,
    };
};

const mapDispatchToProps = (dispatch: Dispatch) => ({
    handleAction: (action) => dispatch(action),
});

export default connect(mapStateToProps, mapDispatchToProps)(SearchBarComponent)