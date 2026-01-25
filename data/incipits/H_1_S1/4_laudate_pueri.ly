\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key es \major \time 4/4 \tempoMarkup "[no tempo]"
    r8 es' f16( es) es8-! r g as16( g) g8-!
    r2 r8 b c16( b) b( as)
    g4 r r2
    r8 b c16( b) b( a) b4 r
    r2 r8 d, es16( d) d8-!
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key es \major \time 4/4 \tempoMarkup "[no tempo]"
    r8 g' as16( g) g8-! r b c16( b) b8-!
    r2 r8 g' as16( g) g( f)
    es4 r r2
    r8 d es16( d) d( c) d4 r
    r2 r8 b c16( b) b8-!
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key es \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 r8 d'^\solo d d
    d c16 c c8 c c b r4
  }
}

SopranoLyrics = \lyricmode {
  Sit no -- men
  Do -- mi -- ni be -- ne -- di -- ctum,
}

Alto = {
  \relative c' {
    \clef alto
    \key es \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    r2 r8 f^\solo f f
    f es16 es es8 es es d r f
  }
}

AltoLyrics = \lyricmode {
  Sit no -- men
  Do -- mi -- ni be -- ne -- di -- ctum, ex
}

Tenore = {
  \relative c' {
    \clef tenor
    \key es \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 r8 b^\solo c16[ b] b8 r es
    c b as b16 as g f es8 r4
    r8 b' es es es d16[ es] c8. c16
    b4 r r2
    R1
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te pu -- e -- ri Do -- mi -- num:
  Lau -- da -- te no -- men Do -- mi --
  ni.
}

Basso = {
  \relative c {
    \clef bass
    \key es \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 r8 es^\solo as es r es
    as g f f16 f es es, es8 r4
    r8 g' g c a b f8. f16
    b,4 r r2
    R1
  }
}

BassoLyrics = \lyricmode {
  Lau -- da -- te, lau --
  da -- te pu -- e -- ri Do -- mi -- num:
  Lau -- da -- te no -- men Do -- mi --
  ni.
}

Organo = {
  \relative c {
    \clef bass
    \key es \major \time 4/4 \tempoMarkup "[no tempo]"
    es4-\solo r8 es as, es' r es
    as es4 d8 es4 r
    es4. c8 f b, f' f,
    b4 r8 f' b,4. b8
    c4 es8 f b,4 r8 b
  }
}

BassFigures = \figuremode {
  r1
  r4 <2>8 <6> r2
  r <_!>
  r4. q8 r2
  <9 4>8 <8 3> <6> <_!> <9 4> <8 3>4.
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
