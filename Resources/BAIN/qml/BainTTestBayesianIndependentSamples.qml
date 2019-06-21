//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//
import QtQuick 2.8
import QtQuick.Layouts 1.3
import JASP.Controls 1.0

Form
{
	VariablesForm
	{
		height: 200
		AvailableVariablesList { name: "variablesList" }
		AssignedVariablesList
		{
            name: "variables"
            title: qsTr("Dependent Variables")
            singleVariable: false
			suggestedColumns: ["scale"]
        }
		AssignedVariablesList
		{
            name: "groupingVariable"
            title: qsTr("Grouping Variable")
            singleVariable: true
			suggestedColumns: ["nominal"]
        }
    }

	ColumnLayout
	{
		RadioButtonGroup
		{
			title: qsTr("Hypothesis Test")
			name: "hypothesis"

			RadioButton { text: qsTr("Equal vs. not equal")                     ; name: "groupsNotEqual" ; checked: true}
			RadioButton { text: qsTr("Equal vs. bigger")                        ; name: "groupOneGreater" }
			RadioButton { text: qsTr("Equal vs. smaller")                       ; name: "groupTwoGreater" }
			RadioButton { text: qsTr("Bigger vs. smaller")                      ; name: "_4type" }
			RadioButton { text: qsTr("Equal vs. bigger vs. smaller")            ; name: "allTypes" }
		}

		RadioButtonGroup
		{
			title: qsTr("Bayes Factor")
			name: "bayesFactorType"

			RadioButton { text: qsTr("BF\u2080\u2081: Equal vs. other")         ; name: "BF01" ; checked: true}
			RadioButton { text: qsTr("BF\u2081\u2080: Other vs. equal")         ; name: "BF10" }
		}
	}

	ColumnLayout
	{
		Group
		{
			title: qsTr("Tables")
			CheckBox { name: "descriptives"; text: qsTr("Descriptives") }
		}

		Group
		{
			title: qsTr("Plots")
			CheckBox { name: "bayesFactorPlot"; text: qsTr("Bayes factor comparison") }
			CheckBox
			{
				name: "descriptivesPlots"
				text: qsTr("Descriptives plots")
				CIField { name: "descriptivesPlotsCredibleInterval"; text: qsTr("Credible interval") }
			}
		}
    }
}
