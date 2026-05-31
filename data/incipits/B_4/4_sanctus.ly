\version "2.24.2"
\include "header.ly"

ClarinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*2
    r4 \pa d' e8 d g4
    f e d2 \pd
    R1
  }
}

ClarinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*2
    r4 g' g4. e'8~
    e d~ d c g g16 g g4
    R1
  }
}

Timpani = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    R1*2
    r4 g8 g16 g c8 g g g16 g
    g8 g16 g g8 c g g16 g g4
    R1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r8 c'' g e c4. f8
    c g' a8. h16 c8 g e c
    r g' d h g4. c8
    g d' e8. fis16 g8 d h g
    r g' g g g( f) f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    r8 e' c g a g c4~
    c8 e c f~ f e16 d e8 c
    r h g d e d g4~
    g8 h g c~ c h16 a h8 g
    cis4. cis8 d4 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 g'^\tutti a8[ g] c4
    b a g2
    r g~
    g g
    cis4 cis8 cis d4 d
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ ctus,
  san --
  ctus
  Do -- mi -- nus De -- us,
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 e^\tutti f e8[ a]~
    a g4 f e16[ d] e4
    r d e8[ d] g4
    f e d2
    r8 g g g g[ f] f4
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  _ _ _ ctus,
  san -- _ _
  _ _ ctus
  Do -- mi -- nus De -- us,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    c1~^\tutti
    c2. c,4
    r4 h' c h8[ e]~
    e d4 c8~ c[ h16 a] h4
    r8 b b b b[ a] a4
  }
}

TenoreLyrics = \lyricmode {
  San --
  ctus,
  san -- _ _
  _ _ ctus
  Do -- mi -- nus
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    g'1~
    g2. g,4
    r8 e' e e d4 d
  }
}

BassoLyrics = \lyricmode {
  San --
  ctus
  Do -- mi -- nus De -- us,
}

Organo = {
  \relative c {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Adagio"
    c'2~ c~
    c2. c,4
    \clef bass g'2~ g~
    g2. g,4
    r8 e' e e d2
  }
}

BassFigures = \figuremode {
  <5 3>2 <6 4>8 <5 \t> <8 3> <\t 6>
  <7- 6> <\t 5> <6 \t> <\t 4> <5 4> \bassFigureExtendersOn <5 3>16 <5 2> <5 3>4 \bassFigureExtendersOff
  <5 3>2 <6 4>8 <5 \t> <8 3> <\t 6>
  <7! 6> <\t 5> <6 \t> <\t 4> <5 4> \bassFigureExtendersOn <5 3>16 <5 2> <5 3>4 \bassFigureExtendersOff
  r8 <6\\ 5->4. <8 6- 4>8 <\t 5 3>4.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
