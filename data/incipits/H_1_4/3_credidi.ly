\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    fis'8 a h g a fis h h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    d'8 d d d d d16 d d d d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    g'8^\solo h16 c d8 g fis e d c
    h a16 h c8 h16 d e[ fis] d[ e] c[ d h c]
    a8 h16 c a4 g r
    R1
    d'8^\tutti d d d d d16 d d d d d
  }
}

SopranoLyrics = \lyricmode {
  Cre -- di -- di, pro -- pter quod lo -- cu -- tus
  sum, e -- go au -- tem hu -- mi -- li -- a --
  _ tus sum ni -- mis.

  Vo -- ta me -- a Do -- mi -- no red -- dam co -- ram
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 a8^\solo h16[ c] d8 e16[ fis]
    g8 d g fis e fis16[ g] a8 d,16[ e]
    fis8 g4 fis8 g fis16[ e] d[ fis e g]
    fis[ g fis g] a[ fis g a] h[ a] g[ fis] e4\trill
    d r8 g16^\tutti g a8 fis g g16 g
  }
}

AltoLyrics = \lyricmode {
  E -- go di -- xi
  in ex -- ces -- su, in ex -- ces -- su
  me -- _ o: O -- mnis ho --
  _ _ _ mo men --
  dax. e -- go ser -- vus tu -- us, et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*2
    d8^\solo d16 d d([ a)] h[ c] h8 c16 c d8 c16[ h]
    a d d d d8 d16 d d8 e16[ d] d8[ cis]
    d a^\tutti h8. h16 a4 h8 h
  }
}

TenoreLyrics = \lyricmode {
  Ca -- li -- cem sa -- lu -- ta -- ris ac -- ci -- pi -- %3
  am, et no -- men Do -- mi -- ni in -- vo -- ca --
  bo. O Do -- mi -- ne, qui -- a
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 c'8^\solo h a g16 g
    d'8[ g,] d8. d16 g,4 r8 c
    d e16 e fis8 d g e16 e a8[ a,]
    d fis16^\tutti fis g g h h fis8 d g h16 h
  }
}

BassoLyrics = \lyricmode {
  Quid re -- tri -- bu -- am
  Do -- _ mi -- no pro
  o -- mni -- bus quae re -- tri -- bu -- it mi --
  hi? Pre -- ti -- o -- sa in con -- spe -- ctu Do -- mi -- ni
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "[no tempo]"
    g8-\solo g' fis e d c h a
    << { g' fis e d } \\ { g, s4. } >> c8 h a g
    d' g d d, g a h c
    d e fis d g e a a,
    d-\tutti fis g h fis d g h
  }
}

BassFigures = \figuremode {
  r1
  r8 <6> q q r2
  r4 <4>8 <3> r2
  r2. <4>8 <_+>
  r1
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
