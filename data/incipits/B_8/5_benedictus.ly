\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key cis \minor \time 4/4 \tempoMarkup "Tempo giusto"
    r2 gis''32(\f e16.) dis32( cis16.) a'32( fis16.) e32( dis16.)
    e8 e, r cis' dis16 e fis8 r4
    r2 h,32( gis16.) fis32( e16.) cis'32( a16.) gis32( fis16.)
    gis8 e r4 fis'32(\p dis16.) cis32( h16.) gis'4~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key cis \minor \time 4/4 \tempoMarkup "Tempo giusto"
    r2 gis''32(\f e16.) dis32( cis16.) fis32( dis16.) cis32( his16.)
    cis8 cis, r a' fis16 e dis8 r4
    r2 h'32( gis16.) fis32( e16.) a32( fis16.) e32( dis16.)
    e4 r r dis'32(\p his16.) ais32( gis16.)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key cis \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    gis'8^\solo^\markup \remark "a 3" cis4 his8 cis cis r4
    r8 gis a16[ h] cis8 r fis, gis16[ a h8]~
    h a16 gis fis8. fis16 gis4 r
    gis8 h h gis16 gis fis8 fis r gis
  }
}

SopranoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus,
  qui ve -- nit in no --
  mi -- ne Do -- mi -- ni,
  be -- ne -- di -- ctus, qui ve -- nit, qui
}

Alto = {
  \relative c' {
    \clef alto
    \key cis \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    e8.[^\solo^\markup \remark "a 3" fis16] gis8 dis e e r4
    r8 e fis16[ gis] a8 r dis, e16[ fis] gis8
    fis e4 dis8 e4 r
    e8 gis fis e16 e dis8 dis r dis
  }
}

AltoLyrics = \lyricmode {
  Be -- _ ne -- di -- ctus,
  qui ve -- nit in no -- mi --
  ne Do -- mi -- ni,
  be -- ne -- di -- ctus, qui ve -- nit, qui
}

Tenore = {
  \relative c' {
    \clef tenor
    \key cis \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    r8 cis,[^\solo^\markup \remark "a 3" e] gis cis cis, r4
    r8 cis' fis, fis r h e, e'16 e
    dis8 e16 e h8. h16 e,4 r
    e8 e' dis e16 e h8 h r his
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne -- di -- ctus,
  qui ve -- nit, qui ve -- nit in
  no -- mi -- ne Do -- mi -- ni,
  be -- ne -- di -- ctus, qui ve -- nit, qui
}

Basso = {
  \relative c {
    \clef bass
    \key cis \minor \time 4/4 \autoBeamOff \tempoMarkup "Tempo giusto"
    R1*4
  }
}

BassoLyrics = \lyricmode {

}

Organo = {
  \relative c {
    \clef bass
    \key cis \minor \time 4/4 \tempoMarkup "Tempo giusto"
    cis'8_\solo_\markup \remark "a 3" cis, e gis cis4 fis,8 gis
    cis, cis' fis,4 h8 h, e e'
    dis e h4 e,8 e' a, h
    e, e' dis e h4 his
  }
}

BassFigures = \figuremode {
  r4. <_+> <6\\>8 <_+>
  r1
  r4 <4>8 <_+>2 q8
  r1
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
