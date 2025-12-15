from typing import List

TILE_SYMBOLS = ["🔴", "🔵", "🟢", "🟡", "🟣", "🟠"]

def render_board_cli(board: List[List[int]]) -> str:
    if not board:
        return "Пустая доска"
    header = "  " + " ".join(f"{i}" for i in range(len(board[0])))
    rows = []
    for r, row in enumerate(board):
        line = f"{r} " + " ".join(TILE_SYMBOLS[t-1] if 1 <= t <= 6 else "⬜" for t in row)
        rows.append(line)
    return "\n".join([header] + rows)