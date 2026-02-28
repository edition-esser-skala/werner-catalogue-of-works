\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Presto"
    a'4 d2 cis4
    d8 a d4. cis8 h4~
    h a8 g fis d d'4~
    d cis d d~
    d8 d h h cis4. h16 a
    h2 cis
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Presto"
    fis2 g4 e
    a fis d g8 fis
    e2 d
    r a'4. a8
    fis fis g4 e a~
    a8 gis16 fis \hA gis4 a2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    a'4 d2 cis4
    d8[ a] d4. cis8 h4~
    h a8[ g] fis[ d] d'4~
    d cis d d~
    d8 d h h cis4. h16[ a]
    h2 cis
  }
}

SopranoLyricsA = \lyricmode {
  Ut que -- ant
  la -- _ _ _
  _ _ _
  _ xis re --
  so -- na -- re fi -- _
  _ bris
}

SopranoLyricsB = \lyricmode {
  Nun -- ti -- us
  cel -- _ _ _
  _ _ _
  _ so ve --
  ni -- ens O -- lym -- _
  _ po
}

SopranoLyricsC = \lyricmode {
  Glo -- ri -- a
  Pa -- _ _ _
  _ _ _
  _ tri ge --
  ni -- to -- que pro -- _
  _ li
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    fis2 g4 e
    a fis d g8[ fis]
    e2 d
    r a'4. a8
    fis fis g4 e a~
    a8[ gis16 fis] \hA gis4 a2
  }
}

AltoLyricsA = \lyricmode {
  Ut que -- ant
  la -- _ xis, la --
  _ xis
  re -- so --
  na -- re fi -- bris, fi --
  _ bris
}

AltoLyricsB = \lyricmode {
  Nun -- ti -- us
  cel -- _ so, cel --
  _ so
  ve -- ni --
  ens O -- lym -- po, O --
  lym -- po
}

AltoLyricsC = \lyricmode {
  Glo -- ri -- a
  Pa -- _ tri, Pa --
  _ tri
  ge -- ni --
  to -- que pro -- li, pro --
  _ li
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    R1
    a2 h
    cis d
    e fis
    R1
    r4 e4. e8 cis cis
  }
}

TenoreLyricsA = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  re -- so -- na -- re
}

TenoreLyricsB = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  ve -- ni -- ens "O -"
}

TenoreLyricsC = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  ge -- ni -- to -- que
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    d2 e
    fis g
    a h
    R1*2
    r2 a4. a8
  }
}

BassoLyricsA = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  re -- "so -"
}

BassoLyricsB = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  ve -- "ni -"
}

BassoLyricsC = \lyricmode {
  Ut Re
  Mi Fa
  Sol La

  ge -- "ni -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Presto"
    d2 e
    fis g
    a h4. a8
    g4 a d,2
    \clef soprano << {
      d''8 d h h cis4. h16 a
      h4
    } \\ {
      fis8 fis g4 e a~
      a8 gis16 fis
    } >> \clef tenor e4 \clef bass a,4. a8
  }
}

BassFigures = \figuremode {
  r2 <7>4 <6>
  q1
  <9>4 <8>8 <7> r2
  <6 5>1
  r
  r4 <_+>2.
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
