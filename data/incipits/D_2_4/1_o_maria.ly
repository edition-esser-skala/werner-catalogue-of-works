\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Larghetto"
    g'4. fis8 g g g fis
    g g r4 r8 g4 fis8
    g g r4 r a8 a
    gis gis g g fis fis fis fis
    fis2~ fis8 e16 dis e4~
    e dis e8 e4 g8
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Larghetto"
    h4. a8 h d d d
    d d r4 r8 d4 d8
    d d d h a2
    h4 e8 e dis dis d d
    cis4 fis, r h8 h
    ais ais a a gis gis g g
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Larghetto"
    r8 d' g a16 fis g8 g r4
    r16 d\p h c d8 a h16 g\f h d g8 fis
    g g r4 r a8 a
    gis gis g g fis fis fis fis
    fis2~ fis8 e16 dis e4~
    e dis e8 e4 g8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Larghetto"
    r8 h'4 d8 d h r4
    r8 g'4\p fis8 g d4\f a8
    h h h g d' d dis8. dis16
    e4 h h'8 h,4 h8
    cis cis fis fis h,4. h8
    cis cis fis fis h,4 e8 e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    d'4.^\tutti d8 d h16[ c] d8 a
    h h r4 r8 d4 a8
    h h h g d' d dis8. dis16
    e4 h h4. h8
    cis cis fis fis h,4. h8
    cis cis fis4 h, e8 e
  }
}

SopranoLyrics = \lyricmode {
  O Ma -- ri -- a sem -- per
  pi -- a, sem -- per
  pi -- a nos af -- fli -- ctos con -- tur --
  ba -- tos con -- so --
  la -- re, con -- so -- la -- re,
  con -- so -- la -- re, nos "af -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    g'4.^\tutti fis8 g g g fis
    g g r4 r8 g4 fis8
    g g r4 r a8 a
    gis gis g g fis fis fis fis
    fis2~ fis8[ e16 dis] e4~
    e dis e8 e4 g8
  }
}

AltoLyrics = \lyricmode {
  O Ma -- ri -- a sem -- per
  pi -- a, sem -- per
  pi -- a nos af --
  fli -- ctos con -- tur -- ba -- tos con -- so --
  la -- _
  _ re, con -- "so -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    h4.^\tutti a8 h d d d
    d d r4 r8 d4 d8
    d d d h a2
    h4 e8 e dis dis d d
    cis4 fis, r h8 h
    ais ais a a gis gis g g
  }
}

TenoreLyrics = \lyricmode {
  O Ma -- ri -- a sem -- per
  pi -- a, sem -- per
  pi -- a, sem -- per pi --
  a nos af -- fli -- ctos con -- tur --
  ba -- tos, nos af --
  fli -- ctos con -- so -- la -- re, con -- "so -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    g'4.^\tutti d8 h g h d
    g g r4 r8 h,4 d8
    g g g g fis2
    e4 r r h'8 h
    ais ais a a gis gis g g
    fis2 e
  }
}

BassoLyrics = \lyricmode {
  O Ma -- ri -- a sem -- per
  pi -- a, sem -- per
  pi -- a, sem -- per pi --
  a nos af --
  fli -- ctos con -- tur -- ba -- tos con -- so --
  la -- re,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Larghetto"
    g'4.-\tutti d8 h g h d
    g g,\p h d g g,\f h d
    g g, g'4 fis2
    e4 \clef tenor e'8 e dis dis \clef bass h[ h]
    ais ais a a gis gis g g
    fis2 e
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <6>4 <6\\>
  <_+> <_!>2 q4
  r2 <7>4 <6>
  <7 _+> <6\\ _!> <_+> <_!>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
