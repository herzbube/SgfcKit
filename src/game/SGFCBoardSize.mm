// -----------------------------------------------------------------------------
// Copyright 2020 Patrick Näf (herzbube@herzbube.ch)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// -----------------------------------------------------------------------------

// Project includes
#import "../../include/SGFCBoardSize.h"

SGFCBoardSize SGFCBoardSizeMake(SGFCNumber columns, SGFCNumber rows)
{
  SGFCBoardSize boardSize;
  boardSize.Columns = columns;
  boardSize.Rows = rows;

  return boardSize;
}

bool SGFCBoardSizeIsSquare(SGFCBoardSize boardSize)
{
  return (boardSize.Columns == boardSize.Rows);
}

bool SGFCBoardSizeEqualToBoardSize(SGFCBoardSize boardSize1, SGFCBoardSize boardSize2)
{
  if (boardSize1.Columns != boardSize2.Columns)
    return false;
  else if (boardSize1.Rows != boardSize2.Rows)
    return false;
  else
    return true;
}

bool SGFCBoardSizeNotEqualToBoardSize(SGFCBoardSize boardSize1, SGFCBoardSize boardSize2)
{
  return ! SGFCBoardSizeEqualToBoardSize(boardSize1, boardSize2);
}
