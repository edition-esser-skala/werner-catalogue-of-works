\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    c'1-\solo
    b2 a4 d
    g, fis8 g a2
    d,4 b'8 a g2
    c,4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    a'1-\solo
    g4 e f8 a g f
    es4 c2 a4
    b4. c16 d e4 g
    a r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a'4.^\solo b16[ c] fis,4 fis16[ g] a8
    b4 a8 g f d r d'
    es2. d8 c
    b[ c] d4 c b
    a r r2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta, pec --
  ca -- ta, pec --
  ca -- ta mun -- _
  di:
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*3
    r2 r4 g'~^\solo
    g8 c, f es d4. g8
  }
}

AltoLyrics = \lyricmode {
  Mi -- %4
  se -- re -- re, mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*4
    r4 c4.^\solo f,8 b4
  }
}

TenoreLyrics = \lyricmode {
  Mi -- se -- "re -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f,4-\solo f'8 es d2
    cis d4 h
    c8 c' a g fis2
    g4. f8 e2
    f4 a, b2
  }
}

BassFigures = \figuremode {
  r2 <_+>
  <7- 5>4 <6> <_!>2
  <_-> <7>4 <6>8 <5>
  r2 <6>4 <5>
  <9> <6> <9> <8>
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
