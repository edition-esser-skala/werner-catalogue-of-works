\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    %tacet
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    %tacet
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    c'4^\solo d c b8. b16
    a8 f'4 e8 d4 c
    r2 r8 c4 h8
    c4 a8 d h8. h16 g8 c~
    c a f b g c a8. a16
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi --
  num, o -- mnes gen -- tes,
  Quo -- ni --
  am con -- fir -- ma -- ta est su --
  per nos mi -- se -- ri -- cor -- "di -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    r4 r8 f4^\solo e8 f4
    e8 a f8. f16 d8 g4 e8
    c f d g e8. e16 f8 d~
  }
}

AltoLyrics = \lyricmode {
  Quo -- ni -- am %3
  con -- fir -- ma -- ta est su -- per
  nos mi -- se -- ri -- cor -- di -- a "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r4 r8 c^\solo c h c a
    b c a8. a16 g4 r
    R1*2
  }
}

TenoreLyrics = \lyricmode {
  lau -- da -- te e -- um,
  o -- mnes po -- pu -- li.
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r8 g'^\solo e f
    d e f4 c d8. d16
    c4 r r2
    R1
  }
}

BassoLyrics = \lyricmode {
  lau -- da -- te
  e -- um, o -- mnes po -- pu --
  li.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    f,8-\solo f' b, b'~ b a d, e
    f d h c f g e f
    d e f4 c d
    c d g e
    a8 f b g c4 f,
  }
}

BassFigures = \figuremode {
  r2 <2>4 <6>
  r <6 5> q8 <_!> <6>4
  <6->8 <6>4. <4>8 <3> <7> <6!>
  <5> <6>4. <_!>4 <5>8 <6>
  r2. <5>8 <6>
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
