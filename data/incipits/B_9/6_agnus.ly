\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    r8 cis' e a a( gis) fis fis
    fis( eis) eis eis fis fis gis a~
    a gis r4 r gis8 gis
    a4 eis fis4. fis8
    fis4 e fis8 fis e e
    dis2\trill cis8 e a gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 4/4 \tempoMarkup "Largo"
    r8 a' cis cis cis( h) a a
    a( gis) gis cis a a h cis
    h4 his8 his cis4 d
    cis8 cis h h h4 ais
    his8 his cis cis dis4 cis~
    cis his cis e8 d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    cis'4.^\tutti cis8 cis[ h] a a
    a[ gis] gis cis a a h[ cis]
    h4 his8 his cis4 d
    cis8 cis h h h4 ais
    his8 his cis cis dis4 cis~
    cis his cis r
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se -- re -- re,
  mi -- se -- re -- re no -- bis,
  mi -- se -- re -- re no -- _
  _ bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    e4.^\tutti a8 a[ gis] fis fis
    fis[ eis] eis eis fis fis gis[ a]
    gis4 r r gis8 gis
    a4 eis fis4. fis8
    fis4 e fis8 fis e e
    dis2\trill cis4 r
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- se -- re -- re
  no -- bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a4^\tutti e' e cis8 cis
    cis4 cis8 gis fis fis d'[ e]
    e4 r r eis8 eis
    fis4 h, cis4. cis8
    dis4 gis, a8 a gis gis
    gis2 gis4 r
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se --
  re -- re, mi -- se -- re -- re
  no -- bis.
}

Basso = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    a'4.^\tutti a8 e4 fis8 fis
    cis4 cis8 cis d d h[ a]
    e'4 r r h'8 h
    a4 gis fis8 fis fis e
    dis4 cis his cis
    gis'2 cis,4 r
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta mun --
  di: Mi -- se --
  re -- re, mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 4/4 \tempoMarkup "Largo"
    a'4.-\tutti a8 e4 fis
    cis4. cis8 d4 h8 a
    e'4 r r h'
    a gis fis4. e8
    dis4 cis his cis
    gis' gis, cis cis'8-\solo h!
  }
}

BassFigures = \figuremode {
  r2 <6 4>8 <5 _+> <5>4
  <6 4>8 <5 _+>4. <5>4 <6\\>
  <4>8 <_+> r2 <6\\ 4\+ 3>4
  <6> <6\\> <8 4> <\t _+>
  <6\\>4 <_!> <7 5>2
  <4>4 <_+>2 <6>8 <6\\>
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
        \set Staff.instrumentName = "b"
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
