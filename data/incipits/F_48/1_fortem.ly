\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \twofourtime \key e \major \time 2/4 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    r4 r8 h'
    cis dis e cis
    dis e4 dis8
    e r r4
    r8 h cis cis
    dis e a,16 h cis dis
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \twofourtime \key e \major \time 2/4 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    e4 fis8 gis
    a fis gis a~
    a16 h gis a fis8. fis16
    e8 a gis fis
    fis gis8. gis16 fis8
    r e fis fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \twofourtime \key e \major \time 2/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    r4 r8 h'
    cis dis e cis
    dis e4 dis8
    e r r4
    r8 h cis cis
    dis e a,16[ h] cis[ dis]
  }
}

SopranoLyricsA = \lyricmode {
  For --
  tem vi -- ri -- li
  pe -- _ cto --
  re
  lau -- de -- mus
  o -- mnes fe -- "mi -"
}

SopranoLyricsB = \lyricmode {
  Car --
  nem do -- mans je --
  ju -- _ ni --
  is
  dul -- ci -- que
  men -- tem pa -- "bu -"
}

SopranoLyricsC = \lyricmode {
  De --
  o Pa -- tri sit
  glo -- _ ri --
  a
  e -- ius -- que
  so -- li Fi -- "li -"
}

Alto = {
  \relative c' {
    \clef alto
    \twofourtime \key e \major \time 2/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    e4 fis8 gis
    a fis gis[ a]~
    a16[ h gis a] fis8. fis16
    e8 a gis fis
    fis[ gis8.] gis16 fis8
    r e fis fis
  }
}

AltoLyricsA = \lyricmode {
  For -- tem vi --
  ri -- li pe --
  _ cto --
  re, vi -- ri -- li
  pe -- cto -- re
  lau -- de -- mus
}

AltoLyricsB = \lyricmode {
  Car -- nem do --
  mans je -- ju --
  _ ni --
  is, do -- mans je --
  ju -- ni -- is
  dul -- ci -- que
}

AltoLyricsC = \lyricmode {
  De -- o Pa --
  tri sit glo --
  _ ri --
  a, Pa -- tri sit
  glo -- ri -- a
  e -- ius -- que
}

Tenore = {
  \relative c' {
    \clef tenor
    \twofourtime \key e \major \time 2/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    R2*2
    r4 r8 h
    cis dis e cis
    dis16[ cis] h4 ais8
    h r r4
  }
}

TenoreLyricsA = \lyricmode {
  For --
  tem vi -- ri -- li
  pe -- _ cto --
  re
}

TenoreLyricsB = \lyricmode {
  Car --
  nem do -- mans je --
  ju -- _ ni --
  is
}

TenoreLyricsC = \lyricmode {
  De --
  o Pa -- tri sit
  glo -- _ ri --
  a
}

Basso = {
  \relative c {
    \clef bass
    \twofourtime \key e \major \time 2/4 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    R2*3
    r8 fis gis ais
    h gis e fis
    h, r r4
  }
}

BassoLyricsA = \lyricmode {
  For -- tem vi --
  ri -- li pe -- cto --
  re
}

BassoLyricsB = \lyricmode {
  Car -- nem do --
  mans je -- ju -- ni --
  is
}

BassoLyricsC = \lyricmode {
  De -- o Pa --
  tri sit glo -- ri --
  a
}

Organo = {
  \relative c {
    \clef soprano
    \twofourtime \key e \major \time 2/4 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/4
    << {
      r4 r8 h''
      cis dis e cis
      dis e4
    } \\ {
      e,4 fis8 gis
      a fis gis a~
      a16 h gis a fis8
    } >> \clef tenor h,8
    cis \clef bass fis,[ gis ais]
    h gis e fis
    h, \clef soprano << {
      e'' a,16 h cis dis
    } \\ {
      e,8 fis fis
    } >>
  }
}

BassFigures = \figuremode {
  r2
  r
  r4. <_+>8
  r <6\\> <6> <6 5>
  <_+> <6> <6 5> <_+>
  r2
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
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
