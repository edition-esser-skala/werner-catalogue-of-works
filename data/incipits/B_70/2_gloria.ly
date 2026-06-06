\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    \mvDl <g d' b' g'>4 r <g d' h' g'> r
    c'8 d e8. e16 d4 r
    es8 f4 g es8 c f
    d16 f g( f) r es, f( es) d4 r
    r16 d' es( f) r as g( f) es4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    \mvDl <g d' b' g'>4 r <g d' h' g'> r
    g'8 b a8. a16 a4 r
    c d es8 g c, f
    d16 d es( d) r c, d( c) b4 r
    r16 h' c( d) r f es( d) c4 r
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    d'8^\tutti g \tuplet 3/2 8 { d16[ c d] b[ a b] } g8 d' \tuplet 3/2 8 { h16[ a \hA h] g[ f g] }
    c8 b a8.\trill a16 a8 a4 h8
    c4. b8 b4 a
    b8 r r4 r8 d d d
    d r r4 c8 c c c16 c
  }
}

SopranoLyrics = \lyricmode {
  Et in ter -- ra pax, in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  tis. Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti r d r8 g~
    g f e8. e16 fis8 fis4 g8
    es[ f] f[ g] g4 f
    f8 r r4 r8 f d f
    g r r4 g8 g g g16 g
  }
}

AltoLyrics = \lyricmode {
  Pax, pax, pax __
  ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  tis. Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    b4^\tutti r h r
    c8 d e cis a4 r
    r8 c d4 es8 es c4
    d8 r r4 r8 b b b
    h r r4 es8 es es es16 es
  }
}

TenoreLyrics = \lyricmode {
  Pax, pax, pax __
  ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta --
  tis. Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4^\tutti r f r
    es8 d cis8. cis16 d4 r
    c'8 a b g es4 f
    b,8 r r4 r8 b' b b
    g r r4 c,8 c' c c16 c
  }
}

BassoLyrics = \lyricmode {
  Pax, pax,
  pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta -- _
  tis. Lau -- da -- mus
  te, be -- ne -- di -- ci -- mus
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Vivace"
    g'4-\tutti r f r
    es8 d cis4 d r
    c'8 a b g es4 f
    b,8-! r f-! r b b' b b
    g r g,-! r c c' c c
  }
}

BassFigures = \figuremode {
  r2 <6 4!>
  <6>8 <6> <6>4 <_+>2
  <_->8 <6> <9> <3> r2
  r <3>
  <_!> <_->
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
