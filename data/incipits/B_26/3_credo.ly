\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    g''16 d h g h'4 r
    d16 a fis d d'4 r
    h16 g d h \sbOn \tuplet 3/2 8 { g fis g h a h d c d g fis g \sbOff }
    fis d a fis r4 d16 fis a d
    h d g h, c e g c, d g, d' g
    e8 g16 e c8 e16 c a fis a d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    r4 g''16 d h g g'4
    r a16 fis d a fis'8 d~
    d h~ \sbOn \tuplet 3/2 8 { h16 a h d c d g fis g h a h } \sbOff
    a fis d a r4 d,16 fis a d
    h d g h, c e g c, d g, d' g
    e8 g16 e c8 e16 c a fis a d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    d'8^\tutti d r d h d
    a a r a a d
    h4 h8 d h4\trill
    a r8 a4 d8
    h8. h16 c4 d8. d16
    g,8 c4 e8 d4
  }
}

SopranoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et in -- "vi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    g'8^\tutti g r g g g
    fis fis r fis d fis
    g4 g8 d d[ g]
    fis4 r8 fis[ a] fis
    g4 g8 g g8. g16
    g4 e8 e a4
  }
}

AltoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et in -- "vi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    h8^\tutti h r h d d
    d d r d d d
    d4 d8 d d4
    d r8 d4 d8
    d4 e8 e d8. d16
    c4 e a,
  }
}

TenoreLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et "in -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    g'8^\tutti g, r g' g, g'
    d d r d fis d
    g4 g8 h g16[ d h g]
    d'4 r8 d[ fis] d
    g8. g16 e4 h8. h16
    c4 a'8 a fis4
  }
}

BassoLyrics = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter --
  rae, vi -- si --
  bi -- li -- um o -- mni --
  um et in -- "vi -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Vivace"
    g4-\tutti r g'16 d h g
    d'4 r d'16 a fis d
    g d h g g' d h g g' d h g
    d'4 d'16 a fis d fis8 d
    g4 e h
    c a' fis
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r4 <6>2
  r2.
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
