\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 r4 fis'8 fis16 fis
    fis8 fis g fis16 fis fis8 fis16 fis gis8 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 r4 d'8 d16 d
    cis8 d cis cis16 cis d8 d16 d d8 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r8 a'^\solo a a fis e16 d d'8 d
    h g r e' e cis d e
    fis e16[ d] \grace d8 cis8. cis16 d4 d8^\tutti d16 d
    cis8 d cis cis16 cis d8 d16 d d8 d
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te e -- um,
  o -- mnes po -- pu -- li. Glo -- ri -- a
  Pa -- tri, glo -- ri -- a Fi -- li -- o et "Spi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r8 h^\solo e fis16 g cis,8 h16 a a'8 g
    a g16[ fis] e4 fis fis8^\tutti fis16 fis
    fis8 fis g fis16 fis fis8 fis16 fis gis8 h
  }
}

AltoLyrics = \lyricmode {
  Et ve -- ri -- tas Do -- mi -- ni ma -- net
  in ae -- ter -- num. Glo -- ri -- a
  Pa -- tri, glo -- ri -- a Fi -- li -- o et "Spi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r2 r4 h8^\tutti h16 h
    cis8 h h ais16 ais h8 h16 h h8 h
  }
}

TenoreLyrics = \lyricmode {
  Glo -- ri -- a
  Pa -- tri, glo -- ri -- a Fi -- li -- o et "Spi -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 d8^\solo d16 e fis8 d
    g g16 fis g8 e a a16[ g] fis8 e
    d g16 g a8[ a,] d4 h'8^\tutti h16 h
    ais8 h e, fis16 fis h,8 h16 h e8 gis
  }
}

BassoLyrics = \lyricmode {
  Quo -- ni -- am con -- fir --
  ma -- ta est su -- per nos mi -- se -- ri --
  cor -- di -- a e -- ius. Glo -- ri -- a
  Pa -- tri, glo -- ri -- a Fi -- li -- o et "Spi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d8-\solo fis cis a d d16 e fis8 d
    g, g'16 fis g8 e a, a'16 g fis8 e
    d g a a, d d'16 cis h8-\tutti h
    ais h e, fis h, h e gis
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>2.
  r8 <6>16 <5> <4>8 <3> r2
  r4 <6 5>8 <_+> r4 <7>8 <6 5>
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
