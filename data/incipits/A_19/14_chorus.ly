\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'16.\f a32 h16. c32 d16. e32 fis16. d32 g16. a32 h16. c32 d16. h32 g16. h32
    e,16. c'32 a16. c32 fis,16. a32 d,16. c32 h16(\p d) e( d) d,( c') d( c)
    h\f c32 d e fis g a h8 a r32 g, a h cis d e fis g8 fis
    e16(\p a) gis( f) e( d) cis( h) \hA cis( f) e( d) cis( b) a( gis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g'16.\f a32 h16. c32 d16. e32 fis16. d32 g16. a32 h16. c32 d16. h32 g16. h32
    e,16. c'32 a16. c32 fis,16. a32 d,16. c32 h4\p d,16( a') fis( a)
    d,16\f e32 fis g a h c d8 d, r32 e fis g a h cis d e8 d
    cis8.\p d16 \hA cis( h) a( gis) a a g( f) e( d) cis( d)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 g' d' d r h g' g
    e e d d d d r4
    r8 d d e16 fis g8 g4 fis8
    e e r4 r2
  }
}

SopranoLyrics = \lyricmode {
  So ſter -- bet, ſo ſter -- bet
  und lehr -- net er -- ken -- nen
  des eu -- fren -- den Hoch -- muts Be --
  trüe -- gen
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 h' a a r g h h
    g a fis a g g r4
    r8 g h a16 a g4 a8 a
    a a r4 r2
  }
}

AltoLyrics = \lyricmode {
  So ſter -- bet, ſo ſter -- bet
  und lehr -- net er -- ken -- nen
  des eu -- fren -- den Hoch -- muts Be --
  trüe -- gen
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 d d d r e d d
    c c a a h h r4
    r8 h h cis16 d e8 e4 d8
    cis cis r4 r2
  }
}

TenoreLyrics = \lyricmode {
  So ſter -- bet, ſo ſter -- bet
  und lehr -- net er -- ken -- nen
  des eu -- fren -- den Hoch -- muts Be --
  trüe -- gen
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
    r8 g' fis d r e h h
    c a d d g g, r4
    r8 g g' fis16 fis e4 cis8 d
    a a r4 r2
  }
}

BassoLyrics = \lyricmode {
  So ſter -- bet, ſo ſter -- bet
  und lehr -- net er -- ken -- nen
  des eu -- fren -- den Hoch -- muts Be --
  trüe -- gen
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
    g8\f g' fis d e e' h h,
    c c' d fis, g\p r fis r
    g\f g,4 fis8 e e' cis d
    a4 r r2
  }
}

BassFigures = \figuremode {
  r1
  r8 <6>2..
  r4. <5\+>16 <6> r4 <6 5>
  <_+>1
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
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
