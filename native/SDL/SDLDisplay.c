#include <SDL2/SDL.h>
#include "native/c_codegen.h"

typedef struct
{
    SDL_Window* window;
    SDL_Renderer* renderer;

    SDLInitErrorCode errorCode;
} SDLDisplay;

SDLInitErrorCode SDGetErrorCode(SDLDisplay* display)
{
    return display->errorCode;
}

SDLDisplay* LogSDLError(SDLDisplay* display, SDLInitErrorCode errorCode)
{
    printf("SDL error: %s\n", SDL_GetError());
    if (display->window != NULL)
        SDL_DestroyWindow(display->window);

    if (display->renderer != NULL)
        SDL_DestroyRenderer(display->renderer);
    
    SDL_Quit();

    display->errorCode = errorCode;
    return display;
}

SDLDisplay* SDInit(const char* title)
{
    SDLDisplay* out = malloc(sizeof(SDLDisplay));

    if (SDL_Init(SDL_INIT_VIDEO) != 0)
        return LogSDLError(out, SDLInitErrorCode_InitVideo_Fail);
    
    out->window = SDL_CreateWindow(title, 0, 0, 100, 100, SDL_WINDOW_FULLSCREEN);
    if (out->window == NULL)
        return LogSDLError(out, SDLInitErrorCode_CreateWindow_Fail);

    out->renderer = SDL_CreateRenderer(out->window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (out->renderer == NULL)
        return LogSDLError(out, SDLInitErrorCode_CreateRenderer_Fail);
    
    out->errorCode = SDLInitErrorCode_Success;
    return out;
}

void SDDestroy(SDLDisplay* display)
{
    SDL_DestroyRenderer(display->renderer);
    SDL_DestroyWindow(display->window);
    SDL_Quit();
    free(display);
}

void SetColour(SDLDisplay* display, int r, int g, int b)
{
    SDL_SetRenderDrawColor(display->renderer, r, g, b, SDL_ALPHA_OPAQUE);
}

void Flush(SDLDisplay* display)
{
    SDL_RenderPresent(display->renderer);
    SetColour(display, 0, 0, 0);
    SDL_RenderClear(display->renderer);
}

void DrawPoint(SDLDisplay* display, int x, int y, int r, int g, int b)
{
    SetColour(display, r, g, b);
    SDL_RenderDrawPoint(display->renderer, x, y);
}

void DrawLine(SDLDisplay* display, int x1, int y1, int x2, int y2, int r, int g, int b)
{
    SetColour(display, r, g, b);
    SDL_RenderDrawLine(display->renderer, x1, y1, x2, y2);
}

void DrawRect(SDLDisplay* display, int x, int y, int w, int h, int r, int g, int b)
{
    SDL_Rect rect = {x, y, w, h};
    SetColour(display, r, g, b);
    SDL_RenderDrawRect(display->renderer, &rect);
}

void FillRect(SDLDisplay* display, int x, int y, int w, int h, int r, int g, int b)
{
    SDL_Rect rect = {x, y, w, h};
    SetColour(display, r, g, b);
    SDL_RenderFillRect(display->renderer, &rect);
}