\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    r2 r4 d'
    cis4. cis8 d a a b
    c4 c b a
    b c4. b8 d4
    cis8 cis d2 \hA cis4
    d8 d,4 d8 h'2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    a'4. a8 b2~
    b4 a8 g a4 r
    r8 fis fis fis g4. f8
    es2 d8 d b'4
    a f e2\trill
    d4 r r8 gis4 gis8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    a'4.^\tutti a8 b2~
    b4 a8[ g] a a a[ b]
    c!4 c b a
    b c4. b8 d4
    cis8 cis d2 \hA cis4
    d8 d,4 d8 h'2
  }
}

SopranoLyrics = \lyricmode {
  A -- gnus De --
  _ i, qui tol --
  lis pec -- ca -- ta
  mun -- _ di, pec --
  ca -- ta mun -- _
  di: Mi -- se -- "re -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 fis4^\tutti g
    g f8[ e] f4 r
    r8 fis fis fis g4. f8
    es2 d8 d b'4
    a f e2
    d4 r r8 gis4 gis8
  }
}

AltoLyrics = \lyricmode {
  A -- gnus
  De -- _ i,
  pec -- ca -- ta mun -- _
  _ di, pec -- ca --
  _ ta mun --
  di: Mi -- "se -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    cis4.^\tutti cis8 d[ d,] d4
    r8 a' a a g e r f
    g4 f2 r8 g
    e'!4 d b a~
    a r r8 d4 d8
  }
}

TenoreLyrics = \lyricmode {
  A -- gnus De -- i,
  pec -- ca -- ta mun -- di, pec --
  ca -- ta, pec --
  ca -- ta mun -- di: __
  Mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 d4.^\tutti d8
    d2 d4 r
    r8 es es es cis4 d
    g, a b4. g8
    a8 a' b f g4 a
    d, r r8 f4 f8
  }
}

BassoLyrics = \lyricmode {
  A -- gnus
  De -- i,
  pec -- ca -- ta mun -- _
  di, pec -- ca -- _
  ta, pec -- ca -- ta mun -- _
  di: Mi -- "se -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d2~-\tutti d~
    d~ d4 r
    r8 es es es cis4 d
    g, a b4. g8
    a a' b f g4 a
    d, r r8 f4 f8
  }
}

BassFigures = \figuremode {
  <3>2 <6- _+>4 <\t 4>
  <7\\ 6 4> \bassFigureExtendersOn <7\\ 5 3>8 <7\\ 4 2> \bassFigureExtendersOff <8 5 3>2
  r8 <6 4 2\+>4. <7 5>4 <5 4>8 <\t 3>
  <6->4 <5> <9>8 <8>4.
  r2 <6 5>4 <_+>
  r2 r8 <4! 2\+>4.
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
