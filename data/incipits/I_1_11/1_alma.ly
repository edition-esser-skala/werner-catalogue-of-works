\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegretto passato"
    R2
    r8 a''16\p b c8 d16 b
    c8 a,16 b c8 d16 b
    c8 a r f'
    d16(\trill c) d8 b' d,
    c16(\trill b) c8 a' c,
    b16(\trill a) b8 g' b,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegretto passato"
    R2
    r8 f'16\p g a8 b16 g
    a8 f,16 g a8 b16 g
    a8 f a16 g a8~
    a b, g'4~
    g8 a, f'4~
    f8 g, r g'
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegretto passato" \autoBeamOff
    f8.[^\solo g16] a[ b a b]
    c8[ a] f4
    f'4. f8
    f[ c] a[ f]
    b16[\trill a b c] d[ e f g]
    a,[\trill g a b] c[ d e f]
    g,[\trill f g a] b[ c d e]
  }
}

SopranoLyrics = \lyricmode {
  Al -- _
  _ ma
  Re -- dem --
  pto -- ris
  Ma -- _
  _ _
  _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegretto passato"
    f8-\solo f f f
    f4 r
    f r
    f8 c a f
    R2*3
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
