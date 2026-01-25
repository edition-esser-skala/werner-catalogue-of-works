\version "2.24.2"
\include "header.ly"

TromboneI = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "[no tempo]"
    g'2.-\solo fis4
    g8 g16 fis g a b a g4 r
    r8 g16( f) g( f) g( f) es4 r
    r8 f16( es) f( es) f( es) d4 r8 g~
    g4 fis\trill g8 g16 fis g b a g
    fis8 g4 \hA fis8 g4 r
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \tempoMarkup "[no tempo]"
    d4.-\solo c8 d4 c
    d8 b16 a b c d c b4 r
    r8 es16( d) es( d) es( d) c4 r
    r8 d16( c) d( c) d( c) b4 r8 es
    d2 b8 b16( a) b d c b
    a8 b16 c a4\trill g r
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r8 d^\solo d es d c16 b c8 b16[ a]
    b[ a] g8 r4 r8 d' d d
    es16[ d] es8 r4 r8 c c c
    d16[ c] d8 r4 b8 c16[ d] es8 c
    a4. a8 g4 r
    R1
  }
}

TenoreLyrics = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, lau -- da -- te
  e -- um, lau -- da -- te
  e -- um, o -- mnes, o -- mnes
  po -- pu -- li.
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "[no tempo]"
    g'4.-\solo c8 b4 a
    g r g h,
    c r c f
    b,! r b c
    d d, g r8 g
    d' g, d' d, g4 r
  }
}

BassFigures = \figuremode {
  r2 <6>4 <6\\>
  r1
  r
  r
  <4>4 <_+>2.
  q1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "trb"
        \new Staff {
          \set Staff.instrumentName = "1"
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
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
