\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 d'^\solo h g e' d16 d c8. c16
    h8 e a, h c h h8. a16
    h4 r r2
    R1
    a8 d h e dis e16 fis \grace e8 dis4
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num, lau -- da -- te no -- men Do -- mi --
  ni.

  Su -- per coe -- los glo -- ri -- a "e -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 r8 a'^\solo
    d,4 d8 d g fis16 fis g8 e
    fis4 r r2
    r r8 a e a
    fis d r g fis g16 a fis4\trill
  }
}

AltoLyrics = \lyricmode {
  Ex
  hoc nunc et us -- que in sae -- cu --
  lum.
  Et su -- per
  coe -- los glo -- _ ri -- a "e -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r2 r8 h^\solo e16[ dis] e[ fis]
    dis8 dis e d c h16[ a] gis4
    a8 c c d16 a h[ cis] d8 d8. cis16
    d4 r r2
  }
}

TenoreLyrics = \lyricmode {
  A so -- lis %2
  or -- tu us -- que ad oc -- ca --
  sum lau -- da -- bi -- le no -- men Do -- mi --
  ni.
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 r8 g'^\solo c,[ d] e[ fis]
    g8. g16 fis4 e8 d c4
    h r r8 d! e8. e16
    a,8 a'16[ g!] fis8 fis g fis16[ g] a8. a16
    d,4 r r2
  }
}

BassoLyrics = \lyricmode {
  Sit no -- men
  Do -- mi -- ni be -- ne -- di --
  ctum. Ex -- cel -- sus
  su -- per o -- mnes gen -- tes Do -- mi --
  nus.
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g4-\solo r8 g' c, d e fis
    g4 fis e8 d c4
    h8 h'16 a gis4 a8 d, e e,
    a a'16 g fis8 d g fis16 g a8 a,
    d4 g8 e h' e, h4
  }
}

BassFigures = \figuremode {
  r2. <6>4
  r2 <6>8 q <7> <6>
  <_+>4 <6>8 <5!>4 <6 5>8 <_+>4
  r <6 5>2 <_ 4>8 <_ _+>
  r2 <_+>4 <4>8 <_+>
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
