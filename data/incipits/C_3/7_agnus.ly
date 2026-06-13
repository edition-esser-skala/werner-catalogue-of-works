\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    %tacet
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    %tacet
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    d'4.^\solo d8 cis4 d~
    d c4. c8 b4
    b8 b a a a4 gis
    a r r2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol --
  lis pec -- ca -- ta mun -- _
  di:
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    g'4.^\solo g8 fis4 g~
    g8 g f4 e f8 f
    e4. e8 fis4 g8[ f]
    e[ g] f[ \hA e] d[ cis] d4
    cis r r2
  }
}

AltoLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol -- lis pec --
  ca -- ta, pec -- ca --
  _ ta mun -- _
  di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4.^\solo d8 cis4 d~
    d c4. c8 b4
    a2 r
    R1*2
    r2 d8 a fis d
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- _
  i, qui tol --
  lis

  Do -- na, do -- na
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*5
    a'8^\solo e cis a f'4 d
  }
}

BassoLyrics = \lyricmode {
  Do -- na, do -- na e -- is,
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g4-\solo g'2 f4
    es2 d~
    d a'4 gis
    a2 d,4 g
    c, f b,2
    a d
  }
}

BassFigures = \figuremode {
  r4 <3> <4\+ 2> <6>
  <7> <6> <7 _+> <6 4>
  <5 \t> <\t _!> <_+> <7 5>
  <5 4> <\t _!> <7 _+>2
  <7 _!> <7>4 <6\\>
  <_+>2 <_!>4 <_+>
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
