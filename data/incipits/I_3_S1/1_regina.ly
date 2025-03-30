\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    R2.*7
    g'8 g'16 fis g8 g, f' g,
    e' c'16 h c8 e, d h'
    e, c'16 h c8 e, d h'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Andante"
    R2.*7
    d'4 d8 c h4
    c8 e16 d e8 g, h d
    c e16 d e8 c h d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*4
    d'4^\solo g,8 h a c
    h([ d)] g4 d
    c2 h4
    d^\tutti d8[ e] f!4
    e e d
    e c r
  }
}

SopranoLyrics = \lyricmode {
  Qui -- a quem me -- ru --
  i -- sti por --
  ta -- re,
  al -- le -- lu --
  ia, al -- le --
  lu -- ia,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    g'4^\solo c,8[ e] d[ f]
    e[ g] c4 g
    \grace g8 f2 e4
    g f e
    d2 r4
    R2.*2
    g4^\tutti g g
    g g g
    g e r
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re,
  al -- le -- lu --
  ia,

  al -- le -- lu --
  ia, al -- le --
  lu -- ia,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*7 %7
    h4^\tutti h8[ c] d4
    c c d
    g, g r
  }
}

TenoreLyrics = \lyricmode {
  Al -- le -- lu --
  ia, al -- le --
  lu -- ia,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
    R2.*7 %7
    g'4^\tutti g g
    c, c' h
    c c, r
  }
}

BassoLyrics = \lyricmode {
  Al -- le -- lu --
  ia, al -- le --
  lu -- ia,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Andante"
    c2-\solo h4
    c e c
    d g, c
    c d e
    g2 fis4
    g h g
    a d, g
    g-\tutti h g
    c, c' h
    c c, g'
  }
}

BassFigures = \figuremode {
  r2.
  r
  <7>4 q2
  r2.
  r
  r
  <7>4 <7 _+>2
  r <7!>4
  r2.
  r
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
