\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4 a r8 h c c
    h a g d' e d e4
    d8 d d cis d4 r
    r2 d8 d e d16 c
    h4 a8 g g4 h8 a
    h4 e dis8. dis16 dis4
  }
}

ViolinoII = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4 a r8 h c c
    h a g d' e d e4
    d8 d d cis d4 r
    r2 d8 d e d16 c
    h4 a8 g g4 h8 a
    h4 e dis8. dis16 dis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    g'4^\tutti a r8 h c c
    h[ a] g d' e d e4
    d8 d d[ cis] d4 r
    r2 d8 d e d16[ c]
    h4 a8 g g4 h8 a
    h4 e dis8. dis16 dis4
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem coe --
  li et ter -- rae,
  et in -- vi -- si --
  bi -- _ li -- um, et in
  u -- num Do -- mi -- num
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d4^\tutti fis r8 g g a
    g4 d r2
    r8 a' g4 fis r
    r e8 fis g4 g
    g fis d r
    r8 g fis e fis8. fis16 fis4
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem,
  et ter -- rae,
  et in -- vi -- si --
  bi -- li -- um,
  in u -- num Do -- mi -- num
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    h4^\tutti d r8 d e d
    d[ c] h h c h c4
    h r r a8 h
    c8. h16 c4 h8. h16 c8 d
    d d c h16[ a] h4 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem coe --
  li, vi -- si --
  bi -- li -- um o -- mni -- um, in --
  vi -- si -- bi -- li -- um,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    g'4^\tutti d r8 g e fis
    g4 g, r r8 c
    g' fis e4 d fis8 g
    a8. g16 a4 g8 g c, h16[ c]
    d4 d g,2
    r h'4 h8 a
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, coe --
  li et ter -- rae, vi -- si --
  bi -- li -- um et in -- vi -- si --
  bi -- li -- um,
  Fi -- li -- um
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4-\tutti d r8 g e fis
    g4 g, r r8 c
    g' fis e4 d fis8 g
    a g a4 g c,8 h16 c
    d2 g,
    \clef tenor r8 e'' d c \clef bass h4 h8 a
  }
}

BassFigures = \figuremode {
  r1
  r
  r4 <7>8 <6\\>4. <3>8 q
  q q <5> <6>2 r8
  <6 4>4 <5 3>2.
  r8 <3> <7>4 <_+>2
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
