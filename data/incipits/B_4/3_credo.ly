\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'8 g16 f \pa e8 d c d \pd
    e g16 f \pa e8 d c d \pd
    e g16 f \pa e8 g4 c8 \pd
    h h16 h h8 h h4
    r \pa g g
    a2 a4
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c'8 e16 d c8 g4 g8
    g e'16 d c8 g4 g8
    g e'16 d c8 d c e
    d d16 d d8 d d4
    r r c
    c4. c8 d4
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c8 c16 g c8 g c g16 g
    c8 g16 g c8 g c g16 g
    c8 c16 c c8 g c c16 c
    g8 g16 g g8 g g4
    r c8 c16 c c8 c
    c4 r r
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'16 f g4 h8 c h
    c g4 h8 c h
    c g4 h8 g c
    h g d h g4
    r e'~ e16 g f g
    a,8 c f4~ f16 a g a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    e'16 d e4 d8 c d
    e e, e' d c d
    e4. d8 c e
    d8. d16 h8 g d h
    r4 r g'
    a16 c h c a8 f a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    e'4^\tutti e8 d c d
    e4 e8 d c d
    e4 e8 d c[ e]
    d4 d d
    e4. e8 e4
    c4. c8 d4
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um
  o -- mni -- um
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    g'4^\tutti g8 g g g
    g4 g8 g g g
    g4 g8 g g4
    g g g
    g4. g8 g4
    f4. f8 f4
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um
  o -- mni -- um
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c8 d e h
    c4 c8 d e h
    c4 c8 h c4
    h h h
    c4. c8 c4
    a4. a8 a4
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um
  o -- mni -- um
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Allegro"
    c4^\tutti c'8 g e g
    c,4 c8 g' e g
    c,4 c'8 g e[ c]
    g4 g' g
    c e, c
    f4. f8 d4
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um
  o -- mni -- um
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    c4-\tutti c'8 g e g
    c,4 c'8 g e g
    c,4 c'8 g e c
    g h' g d h g
    c c' e, g c, e
    f, a' f a d, f
  }
}

BassFigures = \figuremode {
  r2 <6>4
  r2.
  r
  r4 <\t>2
  r2.
  r
}

\score {
  <<
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { \transposedNameShort "clno" "C" "" "1, 2" }
        \partCombine #'(0 . 10) \ClarinoI \ClarinoII
      >>
    >>
    \new Staff {
      \set Staff.instrumentName = \transposedTimpShort "C" "" "G" ""
      \Timpani
    }
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
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
