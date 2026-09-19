\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    r8 c' c c h h b b
    a a a d c a'4 c,8
    c c c c r dis fis a,
    a( gis) gis4 r2
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    r8 e4 a a8 g g~
    g g f a~ a fis4 a8
    a a a a r a4 dis,8
    dis( e) e4 r2
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r4 e'4.^\solo d8 d c16[ h]
    c2~ c8[ h16 a] h4\trill
  }
}

SopranoLyrics = \lyricmode {
  Mi -- se -- re -- re
  no \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r4 r8 e[^\solo f] fis gis16[ fis] gis8
    a2. gis4
  }
}

AltoLyrics = \lyricmode {
  Mi -- se -- re -- re
  no \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a'4.^\solo a8 d,4 e
    cis d dis dis8 dis
    e4 f fis2
    e r
    R1
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- ta mun --
  di:
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    a'4-\solo a, d e
    cis d dis2
    e4 f fis2
    e d
    r8 dis dis dis e4 e,
  }
}

BassFigures = \figuremode {
  r2 <6 5>4 <5- 3>
  <6 5>2 <7 5>
  <6 4>4 <5 3> <6\\ 5>2
  <8 4>8 <_ _+>4. <9 _!>8 <8 _+> <6 4\+>4
  r8 <7 5>4. <6 4>4 <5 _+>
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
