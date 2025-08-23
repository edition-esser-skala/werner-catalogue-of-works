\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r4 r8 e' cis16 d e cis a8 gis
    a h cis4 r2
    r r4 a'8 a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r4 r8 h' a e fis gis
    a gis16 fis e4 r2
    r r8 d' e e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r8 e'4^\solo d8~
    d cis cis h16[ a] gis8 a4 \hA gis8
    a4 r r2
    R1
    r2 d4^\tutti e8 e
  }
}

SopranoLyrics = \lyricmode {
  Lau -- da --
  te no -- men Do -- _ mi --
  ni.

  Quis si -- cut
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d4^\solo e8 fis g fis16 e fis8. fis16
    e4 r r r8 e
    e e e16[ fis gis e] a8 a, r4
    r8 e' e fis16 gis a8 a, r4
    r2 r4 a'8^\tutti a
  }
}

AltoLyrics = \lyricmode {
  Lau -- da -- te pu -- e -- ri Do -- mi --
  num: A
  so -- lis or -- _ tu
  lau -- da -- bi -- le no -- men
  et "hu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 a^\solo h8 cis d8. d16
    a8 a d d d cis16 cis h8 h
    cis cis r4 r2
    r4 r8 gis a h16 cis d8[ e]~
    e d cis8. cis16 h4 r8 e^\tutti
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te Do -- mi --
  num: Sit no -- men Do -- mi -- ni be -- ne --
  di -- ctum,
  lau -- da -- bi -- le no --
  men Do -- mi -- ni. "Ex -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    a'8^\solo a, h d e fis16 fis d8 e
    a,4 r a'8. g16 fis8 e
    d4 cis r8 e fis gis16 ais
    h8 h h ais h h,^\tutti cis a
  }
}

BassoLyrics = \lyricmode {
  ex hoc nunc et us -- que in sae -- cu --
  lum. us -- que ad oc --
  ca -- sum, lau -- da -- bi -- le no --
  men Do -- mi -- ni. Ex -- cel -- sus
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "[no tempo]"
    d8-\solo fis cis a' h cis d d,
    a' a, h d e fis d e
    a, a' gis e fis cis d e
    fis gis a \hA gis fis e d cis
    h h' e, fis h h,-\tutti cis a!
  }
}

BassFigures = \figuremode {
  r4 r8 <6> q q <9> <8>
  <4> <_+> <9> <6> <7 _+>4 <6 5>8 <_+>
  r1
  <6>8 <5>4 r <6\\ _!> <6\\>8
  r4 <6\\ 5>2 <6>4
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
