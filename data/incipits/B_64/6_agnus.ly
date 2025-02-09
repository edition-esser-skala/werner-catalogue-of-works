\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    a'4. b8 c2
    b a
    a1
    g4. a8 h4 gis
    fis2 e
    e1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    c4. b8 a4 a'
    g2 c,4 f
    es2 d
    d1
    c2 h
    a a'
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r2 e4.^\solo e8
    c'4 a8 a a e16 f g!8 g
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- i, qui tol -- lis pec -- ca -- ta
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r8 f4^\solo g8 a4. b16 c
    e,4 e8. f16 f4 f
    r8 c' a f d4 d
    b'4. d8 gis, gis gis8. a16
    a4. fis8 \grace a4 gis2\trill
    a4 r r2
  }
}

BassoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta,
  pec -- ca -- ta mun -- di:
  Mi -- se -- re -- re, mi -- se --
  re -- re no --
  bis.
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f,1~-\solo
    f~
    f2 fis
    << { g'4. f!8 } \\ { g,2 } >> e'
    dis e
    a, cis
  }
}

BassFigures = \figuremode {
  r1
  <7 4 2>2 <8 5 3>
  <7-> <6>
  r <7 _+>
  <7 5> <4>4 <_+>
  r2 <6>4 <5>
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

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
