\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1
    r8 c'\p c c r h h h
    r e, e e r f f f
    r e e e r dis dis dis
    r e e e r a a a
    r a a a r a a a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    R1
    r8 e\p e e r e e e
    r c c c r c c h
    r h gis' gis r a a a
    r gis gis gis r e e e
    r e e e r f f f
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r4 e~^\solo e8.[ f16] e[ d c32 h a gis]
    a4 r8 a e'16[ dis] e8 e16[ h] h[ d]
    c[ h] c8 r c c4~ c16[ h] d[ a]
    gis4 e'4. dis16[ e] fis8 a,
    gis4 r8 h~ h16[ c] c4.~
    c16[ cis] cis4.~ cis16[ d] d4.
  }
}

TenoreLyrics = \lyricmode {
  Sal -- _
  ve Re -- gi -- na, sal -- ve
  ma -- ter mi -- se -- ri --
  cor -- _ _ _ di --
  ae, sal -- _
  _ \hy
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Adagio"
    a4-\solo r r2
    r8 a' a a r gis gis gis
    r a a a r d, d d
    r e e e r fis fis fis
    r e e e r a a a
    r g! g g r f f f
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <7>4 <6>
  <_+>2 <6\\>
  <_+>1
  <4\+ 2>2 <6>
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
