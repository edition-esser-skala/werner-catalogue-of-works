\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b'4. g8 c a f f'
    d b d c16 b a8 c d4~
    d8 c16 d e8 d16 \hA e f8 f es d16 c
    d8 b d g es c f4~
    f8 d f es16 d c4 f,
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    R1
    r2 f4. d8
    g e c c' a f g a
    b f b4 g8 a a g16 a
    b8 b b, d f4 f8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    b'4. g8 c a f f'
    d b d c16[ b] a8 c d4~
    d8[ c16 d] e8[ d16 \hA e] f8 f es d16 c
    d8 b d g es c f4~
    f8 d f es16[ d] c4 f,
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  Ma -- ter, Re -- dem -- pto -- ris Ma --
  _ ter, quae per -- vi -- a
  coe -- li por -- ta ma -- nes, por --
  ta, por -- ta ma -- nes,
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    r2 f4. d8
    g e c c' a f g a
    b f b4 g8 a a g16 a
    b8 b b, d f4 f8 f
  }
}

AltoLyrics = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- ris Ma -- ter, Re -- dem --
  pto -- ris Ma -- ter, quae per -- vi -- a
  coe -- li por -- ta ma -- nes et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*3
    b4. g8 c a f f'
    d b d c16[ b] a8 c d4
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris %4
  Ma -- ter, Re -- dem -- pto -- ris "Ma -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*4
    r2 f4. d8
  }
}

BassoLyrics = \lyricmode {
  Al -- ma
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b''4. g8 c a f f'
    d b d c16 b << {
      a8 c d4~
      d8 c16 d e8 d16 \hA e f4 es8 d16 c
    } \\ {
      f,4. d8
      g e c c' a f g a
    } >>
    \clef tenor b,4. g8 c a f f'
    d b d c16 b \clef bass f4. d8
  }
}

BassFigures = \figuremode {
  <1>4. q8 q q4.
  r1
  r
  r
  <6>2. q4
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
