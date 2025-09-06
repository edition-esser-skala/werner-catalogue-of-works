\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    R1
    a'4. c8 h e, \hA h' h
    c a e'4. f8 d4~
    d cis d r
    R1*3
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d4. f8 e a, e' e
    f d a'2 gis4
    a r a4. b!8
    g4. a8 f d f4~
    f e f r
    R1*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    r2 r4 d^\solo^\aDue
    e2 f
    g a4 a
    c2 a4 a
    b2 a
  }
}

SopranoLyrics = \lyricmode {
  Be --
  ne -- di --
  _ ctus, qui
  ve -- nit in
  no -- "mi -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*2
    r2 r4 d^\solo
    e2 f
    g a4 a
    c2 a4 a
    b2 a
  }
}

AltoLyrics = \lyricmode {
  Be --
  ne -- di --
  _ ctus, qui
  ve -- nit in
  no -- "mi -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d2.-\solo cis4
    d8 f c a e'4 e,
    a8 a'4 g8 f2
    e d4. c!8
    b4 c f, f'~
    f e f8 f, f' e
    d g d e f f, a f
  }
}

BassFigures = \figuremode {
  r2 <5 2>
  r4 <6> <4> <_+>
  r8 <_+>4. <7>4 <6>
  <7> <6\\>2.
  <6 5>1
  <5 2>4 <6><9>8 <8>4.
  <6->4 <\t>2.
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        % \transpose c c,
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
