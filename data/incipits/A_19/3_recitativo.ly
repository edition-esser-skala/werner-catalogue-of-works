\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "ardito"^\part "Debora" g'\f d' h!16 g es8 es r g16 c
    b8 f as16 c b f g8. g16 g4
    r8 c as16 f d es es8. b16 b4
    \clef bass r8^\part "Barak" e,! g16 b as g \hA as8 r r16 as b c
    fis,8. fis16 fis8 a c, c es d
  }
}

SoliLyrics = \lyricmode {
  Er ſter -- be, er ſter -- be. Di -- ßer
  Schluß, der unß -- re Frey -- heit flüg -- len muß,
  ſoll unſ -- rer Feun -- de Däm -- pfer ſeyn.
  Welch Ra -- ßen nimmt dich ein? Laß -- tu den
  Sanfft -- mueths -- geiſt auß ſei -- nen Trie -- ben
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    h!2 c
    d es
    as b4. \hA as8
    g2 f
    fis1
  }
}

BassFigures = \figuremode {
  <6>2 <_->
  <6->1
  r2 <4>4 <3>
  <6! _->2 <_->
  <5>1
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
