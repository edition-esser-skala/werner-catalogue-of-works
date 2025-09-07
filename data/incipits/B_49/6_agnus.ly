\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r2 c'8 f d b'~
    b a g4 f r
    r8 d4 a'8 es d \hA es4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r4 g'8 c a4 f8 d'
    c2 c4 r
    r8 fis,16 g a8 d, b' a b g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r8 d'^\solo a b16 c b4 b8 b
    b a g4 f r
    r c'8 c a4 b8 c
    fis, fis r d' es d \hA es4
  }
}

SopranoLyrics = \lyricmode {
  qui tol -- lis pec -- ca -- ta, pec --
  ca -- ta mun -- di:
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta "mun -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1
    r2 r8 g'^\solo d e16 f!
    e8 f f[ e] f4 r
    R1*2
  }
}

AltoLyrics = \lyricmode {
  qui tol -- lis pec --
  ca -- ta mun -- di:
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a4.^\solo f'8 e d cis d16[ e]
    d4 d r2
    R1*2
    r2 r4 b8. b16
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i, a -- gnus
  De -- i,

  Mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r2 r4 b'8^\solo g
    e f f[ e] f4 r
    R1
  }
}

BassoLyrics = \lyricmode {
  Mi -- se --
  re -- re no -- bis.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Andante"
    d8-\solo e f d g b a g
    fis4. d8 g4. g,8
    c f c4 f b,
    c8 f c4 f,8 f'4 es8
    d8. e16 fis4 g8 \hA fis g4
  }
}

BassFigures = \figuremode {
  r2 <6>8 <3> <_+>4
  <6>1
  <7>4 <4>8 <3> r2
  r4 <4>8 <3>2 <6>8
  <_+>4 <6> <6->8 <6> <6->4
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
