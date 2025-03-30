\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    g'2 b d
    g4 b8 a g1~
    g2 a fis
    g b a4 g \gotoBar "18"
    g,1 r2
    R1.*4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    R1.
    r2 g' es'
    d c4( b) a( c)
    b2 g r \gotoBar "18"
    g1 r2
    R1.*4
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 3/2 \tempoMarkup "Largo" \autoBeamOff
    R1.*4 \gotoBar "18"
    r2 b1
    c2 d es
    d b c
    b c a
    g1 c2
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/2 \tempoMarkup "Largo" \autoBeamOff
    R1.*4 \gotoBar "18"
    r2 b1
    c2 d es
    d b c
    b c a
    g1 c2
  }
}

AltoETenoreLyricsA = \lyricmode {
  Ve --
  xil -- _ la
  re -- _ gis
  pro -- _ de --
  unt "ful -"
}

AltoETenoreLyricsB = \lyricmode {
  Quae
  vul -- _ ne --
  ra -- _ ta
  in -- _ su --
  per "mu -"
}

AltoETenoreLyricsC = \lyricmode {
  Te
  fons _ sa --
  lu -- _ tis
  tri -- _ ni --
  tas "col -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    g'1 f2
    es2. d4 c2
    b c d
    g,1 g'2 \gotoBar "18"
    g, g' f!
    es d c
    g'1 es2 %20
    d1 d,2
    g b' a
  }
}

BassFigures = \figuremode {
  r1.
  r
  <6>2 <6 5> <_+>
  r1.
  r
  <6>
  r1 <6>2
  <6 4>1 <[5] _+>2
  r1 <5!>2
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
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoETenoreLyricsA
      \new Lyrics \lyricsto Alto \AltoETenoreLyricsB
      \new Lyrics \lyricsto Alto \AltoETenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \AltoETenoreLyricsA
      \new Lyrics \lyricsto Tenore \AltoETenoreLyricsB
      \new Lyrics \lyricsto Tenore \AltoETenoreLyricsC
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
