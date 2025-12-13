\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.
    r2 r4 h' c cis
    dis e e dis e2
    R1.
    r4 fis, d'2 h4 e
    cis cis d8 c h4 a4. a8
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    R1.
    r2 h'2. ais4
    a g fis2 e
    R1.
    r2 r4 h g'2
    e4 a fis g2 fis4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \phrasingSlurDashed
    R1.
    r2 r4 h' c cis
    dis e e dis e2
    R1.
    r4 fis, d'2 h4 e
    cis cis d8[ c] h4 a4. a8
  }
}

SopranoLyricsA = \lyricmode {
  Tri -- stes e --
  rant A -- po -- sto -- li

  de Chri -- sto a --
  cer -- bo fu -- _ _ "ne -"
}

SopranoLyricsB = \lyricmode {
  De -- o Pa --
  tri sit glo -- ri -- a

  et Fi -- li -- o
  qui a mor -- _ _ "tu -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.
    r2 h'2. ais4
    a g fis2 e
    R1.
    r2 r4 h g'2
    e4 a fis g g fis
  }
}

AltoLyricsA = \lyricmode {
  Tri -- stes
  e -- rant, tri -- stes

  de Chri --
  sto a -- cer -- bo fu -- "ne -"
}

AltoLyricsB = \lyricmode {
  De -- o
  Pa -- tri, De -- o

  et Fi --
  li -- o qui a mor -- "tu -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 h c cis dis e
    e dis e h e cis
    h c a h h e,
    c'2 a4 d h h
    h ais h2 r
    r r4 g e' d8[ c]
  }
}

TenoreLyricsA = \lyricmode {
  Tri -- stes e -- rant A --
  po -- sto -- li, tri -- stes e --
  rant A -- po -- sto -- li de
  Chri -- sto a -- cer -- bo
  fu -- ne -- re,
  quem mor -- te
}

TenoreLyricsB = \lyricmode {
  De -- o Pa -- tri sit
  glo -- ri -- a, De -- o Pa --
  tri sit glo -- ri -- a et
  Fi -- li -- o qui a
  mor -- tu -- is
  sur -- re -- xit
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    h'2. ais4 a g
    fis h8[ a] g4. fis8 e4 r
    r2 r4 h g'2
    e4 a fis d g8[ fis d e]
    fis4. fis8 h,2 r4 e
    a2 d,4 e c d
  }
}

BassoLyricsA = \lyricmode {
  Tri -- stes e -- _
  rant A -- po -- sto -- li
  de Chri --
  sto a -- cer -- bo fu --
  _ ne -- re, de Chri --
  sto fu -- _ "ne -"
}

BassoLyricsB = \lyricmode {
  De -- o Pa -- _
  tri sit glo -- ri -- a
  et Fi --
  li -- o qui a mor --
  _ tu -- is et
  qui a mor -- _ "tu -"
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    << {
      f'4\rest h, c cis dis e~
      e dis
    } \\ {
      h2. ais4 a g
      fis h8 a
    } >> g4. fis8 << { e'4 cis } \\ { e,2 } >>
    \clef tenor h'4 c! a \clef bass h, g'2
    << { c2 a4 d h2 } \\ { e,4 a fis d g8 fis d e } >>
    fis2 h, e
    a d,4 e c d
  }
}

BassFigures = \figuremode {
  r1.
  r2 <3 6> <6! 5>4 <6\\>
  <7! _+> <5 3> <6\\ 5> <_+> <6>2
  r1.
  <5\+ 4>4 <\t _+> r1
  <_+>2 <8>8 <7!> <5>4 <6 5>2
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
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
