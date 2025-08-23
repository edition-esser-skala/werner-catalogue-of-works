\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    r8 c' h d c16. c32 h16 a g8 f'
    e16 c32( d e f) g16 a e d\trill c d h a\trill g g' d c\trill h \gotoBar "8"
    c,4 r r2
    r16 e'\p d c a' e d\trill c d h a\trill g g' d c\trill h
    c a g\trill fis fis' c h\trill a h8 h, r4
    r2 r4 r8 e'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Andante"
    R1*2 \gotoBar "8"
    c'4 r r2
    r4 r8 a4\p d g,8~
    g c4 fis,8 g4 r
    r2 r16 h a g e' h a\trill g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "8"
    r8 c'^\solo h d c[ h16 a] g8 f'
    e c r e d4. c16[ h]
    c4. h16[ a] h[ g a h] c[ a h c]
    d2~ d8 c16 h e4
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae --
  ta -- re, lae -- ta -- _
  _ _ _ _
  _ re, lae -- "ta -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "8"
    R1*2
    r2 r8 g'^\solo fis a
    g[ fis16 e] d8 c' h g r h
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, "lae -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Andante"
    c4 d e h
    c c' h e, \gotoBar "8"
    c4 d e h
    c c' h e,
    a d, g, a
    h fis g g'
  }
}

BassFigures = \figuremode {
  r1
  r4 <6> <7> q
  r1
  r4 <6> <7> q
  q <7 _+>2 <6\\>4
  r2. <6>4
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
