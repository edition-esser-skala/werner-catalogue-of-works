\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    a'2 h4 cis
    d fis2 fis4
    h,2 r
    R1*2
    r2 r8 cis d e
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    fis2 g4. fis16 e
    fis8 e d4 r8 a'4 a8
    g2 r
    R1*2
    r2 r8 ais h cis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r8 d'4^\solo fis16[ a,] g8 e'4 g,8
    fis[ g] a h c4. h16[ a]
    g8 e c'4. a8 a g
    g fis r h4^\markup \remark "a 3" d!8 c[ h]
    c[ d] e2 d4
    d2\trill cis4 r
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta
  mun -- di: Mi -- se -- re -- re
  no -- bis, mi -- _ se --
  re -- _ re
  no -- bis.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    r8 g'4^\markup \remark "a 3" g8 fis4. e8
    e dis r4 gis8[ h] a[ \hA gis]
    a[ h] c[ h] ais4 h~
    h8[ ais16 gis] h4\trill ais r
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re
  no -- bis, mi -- se --
  re -- re no -- _
  _ bis.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    h4.^\markup \remark "a 3" h8 e,4 e'
    a,4. g!8 fis4 g
    eis2 fis4 r
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- re -- re,
  mi -- se -- re -- re
  no -- bis.
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*6
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Adagio"
    d2~-\solo d~
    d dis
    e dis4 e
    h \clef tenor h'^\markup \remark "a 3" e, e'
    a,4. g!8 fis4 g
    eis8 eis eis eis fis4. e8
  }
}

BassFigures = \figuremode {
  r2 <6 4 2>4 <7\\ \t \t>
  <8 _+>2 <7! 5>
  r4 <6> <5 3> <4 9>8 <3 8>
  <6 4> <5 _+> q4 q <6! 4>8 <5 _+>
  <_!>4. r8 <7 _+>4 <5>
  <7 5>2 <_+>4 <6 4>8 <8 6\\>
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
